//
//  Measurement+Extensions.swift
//  DTUForecast
//
//  Created by Shape on 20/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import Foundation

extension Measurement where UnitType == UnitTemperature {
    var degreesString: String {
        let measurement = self.converted(to: .celsius)
        let string = DFMeasurementFormatter.temperatureFormatter.string(from: measurement)
        return string.replacingOccurrences(of: "C", with: "").trimmingCharacters(in: .whitespaces)
    }
}
