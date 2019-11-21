//
//  WeatherForecast.swift
//  DTUForecast
//
//  Created by Shape on 20/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import Foundation

extension OpenWeather {
    struct WeatherForecast: Decodable {
        let list: [HourForecast]
        
        var todaysHourlyForecasts: [HourForecast] {
            return list.filter { forecast -> Bool in
                return Calendar.current.isDateInToday(forecast.dataCalculation) || Calendar.current.isDateInTomorrow(forecast.dataCalculation)
            }
        }
        
        var dayForecasts: [DayForecast] {
            let forecastsAfterToday: [HourForecast] = list.filter { forecast -> Bool in
                return !Calendar.current.isDateInToday(forecast.dataCalculation)
            }
            
            var uniqueDays: [HourForecast] {
                var uniqueValues: [HourForecast] = []
                forecastsAfterToday.forEach { item in
                    if !uniqueValues.contains(where: { Calendar.current.isDate($0.dataCalculation, inSameDayAs: item.dataCalculation) }) {
                        uniqueValues += [item]
                    }
                }
                return uniqueValues
            }
            
            return uniqueDays.map { forecast -> DayForecast in
                return DayForecast(date: forecast.dataCalculation, temperatureMin: forecast.main.temperatureMin, temperatureMax: forecast.main.temperatureMax, imageName: forecast.weather.imageName)
            }
        }
    }
}

extension OpenWeather.WeatherForecast {
    struct HourForecast: Decodable {
        let main: OpenWeather.Main
        let weather: [OpenWeather.Weather]
        let dataCalculation: Date
        
        var timeOfDay: String {
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: dataCalculation)
            let minute = calendar.component(.minute, from: dataCalculation)
            
            var minuteString = String(minute)
            if minute == 0 {
                minuteString = "00"
            }            
            return "\(hour):" + minuteString
        }
    }
}

extension OpenWeather.WeatherForecast.HourForecast {
    enum CodingKeys: String, CodingKey {
        case main
        case weather
        case dataCalculation = "dt"
    }
}

extension OpenWeather.WeatherForecast {
    struct DayForecast {
        let date: Date
        let temperatureMin: Measurement<UnitTemperature>
        let temperatureMax: Measurement<UnitTemperature>
        let imageName: String
    }
}
