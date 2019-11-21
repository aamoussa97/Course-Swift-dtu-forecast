//
//  OpenWeather.swift
//  DTUForecast
//
//  Created by Shape on 20/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import Foundation
import CoreLocation

struct OpenWeather {}

extension OpenWeather {
    struct WeahterCoordinates: Decodable {
        enum CodingKeys: String, CodingKey {
            case latitude = "lat"
            case longitude = "lon"
        }
        
        let longitude: CLLocationDegrees
        let latitude: CLLocationDegrees
        
        func asCLLocation2D() -> CLLocationCoordinate2D {
            CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
    }
    
    struct Weather: Decodable {
        /// Weather condition id
        let id: Int
        /// Group of weather parameters (Rain, Snow, Extreme etc.)
        let main: String
        /// Weather condition within the group
        let description: String
        /// Weather icon id
        let icon: String
    }
    
    struct Main: Decodable {
        /// Temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
        let temperature: Measurement<UnitTemperature>
        /// Atmospheric pressure (on the sea level, if there is no sea_level or grnd_level data), hPa
        let pressure: Measurement<UnitPressure>
        /// Humidity, %
        let humidity: Int
        /// Minimum temperature at the moment. This is deviation from current temp that is possible for large cities and megalopolises geographically expanded (use these parameter optionally). Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
        let temperatureMin: Measurement<UnitTemperature>
        /// Maximum temperature at the moment. This is deviation from current temp that is possible for large cities and megalopolises geographically expanded (use these parameter optionally). Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
        let temperatureMax: Measurement<UnitTemperature>
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            temperature = try Measurement(value: container.decode(Double.self, forKey: .temperature), unit: UnitTemperature.kelvin)
            pressure = try Measurement(value: container.decode(Double.self, forKey: .pressure), unit: UnitPressure.hectopascals)
            temperatureMin = try Measurement(value: container.decode(Double.self, forKey: .temperatureMin), unit: UnitTemperature.kelvin)
            temperatureMax = try Measurement(value: container.decode(Double.self, forKey: .temperatureMax), unit: UnitTemperature.kelvin)
            
            humidity = try container.decode(Int.self, forKey: .humidity)
        }
    }
}


extension OpenWeather.Main {
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case pressure
        case humidity
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}

extension OpenWeather {
    struct Wind: Decodable {
        /// Wind speed. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour.
        let speed: Measurement<UnitSpeed>
        /// Wind direction, degrees (meteorological)
        let degree: Measurement<UnitAngle>
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            speed = try Measurement(value: container.decode(Double.self, forKey: .speed), unit: UnitSpeed.metersPerSecond)
            degree = try Measurement(value: container.decode(Double.self, forKey: .degree), unit: UnitAngle.degrees)
        }
    }
}

extension OpenWeather.Wind {
    enum CodingKeys: String, CodingKey {
        case speed
        case degree = "deg"
    }
}

extension OpenWeather {
    struct Clouds: Decodable {
        /// Cloudiness, %
        let all: Int
    }
    
    struct System: Decodable {
        /// Country code (GB, JP etc.)
        let country: String
        /// Sunrise time, unix, UTC
        let sunrise: Date
        /// Sunset time, unix, UTC
        let sunset: Date
    }
}
