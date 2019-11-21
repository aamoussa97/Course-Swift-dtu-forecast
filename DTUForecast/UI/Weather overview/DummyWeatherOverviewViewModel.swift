//
//  DummyWeatherOverviewViewModel.swift
//  DTUForecast
//
//  Created by Shape on 20/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import SwiftUI

private let testHourlyForecasts = [
    WeatherHourlyForecast(time: "9:00", icon: "cloud.bolt.rain", temperature: Measurement(value: 16, unit: UnitTemperature.celsius), isNow: true),
    WeatherHourlyForecast(time: "10:00", icon: "cloud.bolt.rain", temperature: Measurement(value: 16, unit: UnitTemperature.celsius), isNow: false),
    WeatherHourlyForecast(time: "11:00", icon: "cloud.sun", temperature: Measurement(value: 16, unit: UnitTemperature.celsius), isNow: false),
    WeatherHourlyForecast(time: "12:00", icon: "cloud.sun", temperature: Measurement(value: 16, unit: UnitTemperature.celsius), isNow: false),
    WeatherHourlyForecast(time: "13:00", icon: "cloud.sun", temperature: Measurement(value: 16, unit: UnitTemperature.celsius), isNow: false),
    WeatherHourlyForecast(time: "14:00", icon: "cloud.sun.bolt", temperature: Measurement(value: 16, unit: UnitTemperature.celsius), isNow: false),
]

private let testWeatherProperties = [
    WeatherProperty(
        id: .wind,
        name: "Wind",
        formattedValue: "8",
        additionalValue: "NE",
        color: .purple,
        icon: "wind"
    ),
    WeatherProperty(
        id: .humidity,
        name: "Humidity",
        formattedValue: "82%",
        additionalValue: nil,
        color: .blue,
        icon: "waveform"
    ),
    WeatherProperty(
        id: .temperature,
        name: "Temperature",
        formattedValue: "7",
        additionalValue: nil,
        color: Color(hex: "a77956"),
        icon: "thermometer"
    ),
    WeatherProperty(
        id: .pressure,
        name: "Pressure",
        formattedValue: "8",
        additionalValue: nil,
        color: Color(hex: "4ab7e6"),
        icon: "gauge"
    )
]

private let testDaysForecasts = [
    WeatherDayForecast(day: "Monday", icon: "cloud.bolt.rain", low: Measurement(value: 16, unit: UnitTemperature.celsius), high: Measurement(value: 16, unit: UnitTemperature.celsius)),
    WeatherDayForecast(day: "Tuesday", icon: "cloud.bolt.rain", low: Measurement(value: 16, unit: UnitTemperature.celsius), high: Measurement(value: 16, unit: UnitTemperature.celsius)),
    WeatherDayForecast(day: "Wednesday", icon: "cloud.bolt.rain", low: Measurement(value: 16, unit: UnitTemperature.celsius), high: Measurement(value: 16, unit: UnitTemperature.celsius)),
    WeatherDayForecast(day: "Thursday", icon: "cloud.bolt.rain", low: Measurement(value: 16, unit: UnitTemperature.celsius), high: Measurement(value: 16, unit: UnitTemperature.celsius)),
    WeatherDayForecast(day: "Friday", icon: "cloud.bolt.rain", low: Measurement(value: 16, unit: UnitTemperature.celsius), high: Measurement(value: 16, unit: UnitTemperature.celsius)),
]

class DummyWeatherOverviewViewModel: WeatherModel {
    @Published var cityName = "Copenhagen"
    @Published var currentWeatherValues: WeatherCurrentView.Values? = WeatherCurrentView.Values(
        currentTemperature: Measurement(value: 16.39, unit: UnitTemperature.celsius),
        currentTemperatureMin: Measurement(value: 16, unit: UnitTemperature.celsius),
        currentTemperatureMax: Measurement(value: 16, unit: UnitTemperature.celsius),
        description: "Sunny"
    )
    @Published var hourlyForecasts: [WeatherHourlyForecast] = testHourlyForecasts
    @Published var weatherProperties: [WeatherProperty] = testWeatherProperties
    @Published var dayForecasts: [WeatherDayForecast] = testDaysForecasts
    
    func refreshWeather(cityName: String) {}
}
