//
//  WeatherOverviewViewModel.swift
//  DTUForecast
//
//  Created by Shape on 19/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import SwiftUI
import Combine

protocol WeatherModel: ObservableObject {
    var cityName: String { set get }
    var currentWeatherValues: WeatherCurrentView.Values? { get }
    var hourlyForecasts: [WeatherHourlyForecast] { get }
    var weatherProperties: [WeatherProperty] { get }
    var dayForecasts: [WeatherDayForecast] { get }
    func refreshWeather(cityName: String)
}

class WeatherOverviewViewModel: WeatherModel {
    @Published var cityName = "copenhagen"
    @Published var currentWeatherValues: WeatherCurrentView.Values? = nil
    @Published var hourlyForecasts: [WeatherHourlyForecast] = []
    @Published var weatherProperties: [WeatherProperty] = []
    @Published var dayForecasts: [WeatherDayForecast] = []
    
    private let auth = AppId()
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        $cityName.print().sink { [unowned self] name in
            self.refreshWeather(cityName: name)
        }.store(in: &cancellable)
    }
    
    func refreshWeather(cityName: String) {
        /// Dummy data to avoid calling the API while testing
//        let currentWeather = Just(OpenWeather.CurrentWeather.dummy())
//            .delay(for: .seconds(2), scheduler: DispatchQueue.main)
        
        // Current
        let currentWeather = URLSession.shared
            .decodedTaskPublisher(for: OpenWeather.CurrentWeather.request(forCityName: cityName)(auth))
            .map(\.value)
            .catch({ (error) -> Empty<OpenWeather.CurrentWeather, Never> in
                dump(error)
                return Empty<OpenWeather.CurrentWeather, Never>(completeImmediately: true)
            })
            .share()                    
        
        currentWeather.map({ WeatherCurrentView.Values(
            currentTemperature: $0.main.temperature,
            currentTemperatureMin: $0.main.temperatureMin,
            currentTemperatureMax: $0.main.temperatureMax,
            description: $0.weather.first?.description ?? "...")
        })
            .receive(on: DispatchQueue.main)
            .assign(to: \.currentWeatherValues, on: self)
            .store(in: &cancellable)
        
        currentWeather.map({ $0.asProperties() })
            .receive(on: DispatchQueue.main)
            .assign(to: \.weatherProperties, on: self)
            .store(in: &cancellable)
        
        // Forecast
        let weatherForecast = URLSession.shared.decodedTaskPublisher(for: OpenWeather.WeatherForecast.request(forCityName: cityName)(auth))
            .map(\.value)
            .catch({ (error) -> Empty<OpenWeather.WeatherForecast, Never> in
                dump(error)
                return Empty<OpenWeather.WeatherForecast, Never>(completeImmediately: true)
            })
            .share()
        
        weatherForecast.map({ $0.dayForecasts.map { forecast -> WeatherDayForecast in
            return WeatherDayForecast(day: DFDateFormatter.dayNameFormatter.string(from: forecast.date), icon: forecast.imageName, low: forecast.temperatureMin, high: forecast.temperatureMax)
            }
        })
            .receive(on: DispatchQueue.main)
            .assign(to: \.dayForecasts, on: self)
            .store(in: &cancellable)
        
        currentWeather.combineLatest(weatherForecast).map({ value -> [WeatherHourlyForecast] in
            let (current, forecast) = value
            let currentForecast = WeatherHourlyForecast(time: "", icon: current.weather.imageName, temperature: current.main.temperature, isNow: true)
            
            var forecastsWithCurrentWeather = forecast.todaysHourlyForecasts.map { forecast -> WeatherHourlyForecast in
                return WeatherHourlyForecast(time: forecast.timeOfDay, icon: forecast.weather.imageName, temperature: forecast.main.temperature, isNow: false)
            }
            forecastsWithCurrentWeather.insert(currentForecast, at: 0)
            return forecastsWithCurrentWeather
        })
            .receive(on: DispatchQueue.main)
            .assign(to: \.hourlyForecasts, on: self)
            .store(in: &cancellable)
    }
}
