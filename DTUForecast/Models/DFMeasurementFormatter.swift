//
//  DFMeasurementFormatter.swift
//  DTUForecast
//
//  Created by Shape on 20/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import Foundation

struct DFMeasurementFormatter {
    static var temperatureFormatter: MeasurementFormatter {
        let f = MeasurementFormatter()
        f.unitStyle = .short
        f.numberFormatter.maximumFractionDigits = 0
        f.locale = Locale(identifier: "da_DK")
        return f
    }
}
