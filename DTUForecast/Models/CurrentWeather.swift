//
//  CurrentWeather.swift
//  DTUForecast
//
//  Created by Jakob Vinther-Larsen on 29/10/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import SwiftUI

extension OpenWeather {
    struct CurrentWeather: Decodable {
        ///  City ID
        let id: Int
        /// City name
        let name: String
        let coordinates: WeahterCoordinates
        ///  (more info Weather condition codes)
        let weather: [Weather]
        let main: Main
        let visibility: Int
        let wind: Wind
        let clouds: Clouds
        /// Time of data calculation, unix, UTC
        let dataCalculation: Date
        let system: System
    }
}

extension OpenWeather.CurrentWeather {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case coordinates = "coord"
        case weather
        case main
        case visibility
        case wind
        case clouds
        case dataCalculation = "dt"
        case system = "sys"
    }
}

extension OpenWeather.CurrentWeather {
    func asProperties() -> [WeatherProperty] {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .short
        formatter.numberFormatter.maximumFractionDigits = 2
                
        let windspeedFormatter: MeasurementFormatter = {
            let f = MeasurementFormatter()
            f.unitStyle = .short
            f.numberFormatter.maximumFractionDigits = 2
            f.unitOptions = .providedUnit
            return f
        }()
        
        return [
            WeatherProperty(
                id: .wind,
                name: "Wind",
                formattedValue: windspeedFormatter.string(from: wind.speed),
                additionalValue: wind.degree.asCartographyDirection(),
                color: .purple,
                icon: "wind"
            ),
            WeatherProperty(
                id: .humidity,
                name: "Humidity",
                formattedValue: "\(main.humidity)%",
                additionalValue: nil,
                color: .blue,
                icon: "waveform"
            ),
            WeatherProperty(
                id: .temperature,
                name: "Temperature",
                formattedValue: DFMeasurementFormatter.temperatureFormatter.string(from: main.temperature),
                additionalValue: nil,
                color: Color(hex: "a77956"),
                icon: "thermometer"
            ),
            WeatherProperty(
                id: .pressure,
                name: "Pressure",
                formattedValue: formatter.string(from: main.pressure),
                additionalValue: nil,
                color: Color(hex: "4ab7e6"),
                icon: "gauge"
            )            
        ]
    }
}


extension OpenWeather.CurrentWeather {
    static func dummy() -> OpenWeather.CurrentWeather {
        let data = currentWeatherDummyJson.data(using: .utf8)!
        return try! JSONDecoder().decode(OpenWeather.CurrentWeather.self, from: data)
    }
}

let currentWeatherDummyJson = """
{
  "coord": {
    "lon": -122.08,
    "lat": 37.39
  },
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 296.71,
    "pressure": 1013,
    "humidity": 53,
    "temp_min": 294.82,
    "temp_max": 298.71
  },
  "visibility": 16093,
  "wind": {
    "speed": 1.5,
    "deg": 67.6
  },
  "clouds": {
    "all": 1
  },
  "dt": 1560350645,
  "sys": {
    "type": 1,
    "id": 5122,
    "message": 0.0139,
    "country": "US",
    "sunrise": 1560343627,
    "sunset": 1560396563
  },
  "timezone": -25200,
  "id": 420006353,
  "name": "Mountain View",
  "cod": 200
}
"""
