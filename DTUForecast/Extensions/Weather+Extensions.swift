//
//  Weather+Extensions.swift
//  DTUForecast
//
//  Created by Shape on 20/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import Foundation

extension Collection where Element == OpenWeather.Weather {
    var imageName: String {
        let icon = first?.icon ?? "01d"
        switch icon {
        case "01d", "01n":
            return "sun.max.fill"
        case "02d", "02n":
            return "cloud.sun.fill"
        case "03d", "03n":
            return "cloud.fill"
        case "04d", "04n":
            return "smoke.fill"
        case "09d", "09n":
            return "cloud.drizzle.fill"
        case "10d", "10n":
            return "cloud.rain.fill"
        case "11d", "11n":
            return "cloud.bolt.fill"
        case "13d", "13n":
            return "cloud.snow.fill"
        case "50d", "50n":
            return "cloud.fog.fill"
        default:
            return "cloud.fill"
        }
    }
}
