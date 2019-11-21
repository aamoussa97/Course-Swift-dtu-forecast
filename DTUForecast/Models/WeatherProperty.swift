//
//  WeatherProperty.swift
//  DTUForecast
//
//  Created by Shape on 20/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import SwiftUI

enum WeatherPropertyIdentifier: Int {
    case rain
    case wind
    case windDirection
    case humidity
    case pressure
    case temperature
    case maxTemperature
    case minTemperature
}

struct WeatherProperty: Hashable, Identifiable {
    let id: WeatherPropertyIdentifier
    let name: String
    let formattedValue: String
    let additionalValue: String?
    let color: Color
    let icon: String
}
