//
//  WeatherDaysForecastListView.swift
//  DTUForecast
//
//  Created by Shape on 19/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import SwiftUI

struct WeatherDaysForecastListView: View {
    let days: [WeatherDayForecast]
    
    var body: some View {
        VStack {
            ForEach(days) { day in
                WeatherDayForecastView(forecast: day)
                Divider()
            }
        }
    }
}

struct WeatherDaysForecastListView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDaysForecastListView(days: [
            WeatherDayForecast(day: "Monday", icon: "cloud.bolt.rain", low: Measurement(value: 16, unit: UnitTemperature.celsius), high: Measurement(value: 16, unit: UnitTemperature.celsius)),
            WeatherDayForecast(day: "Tuesday", icon: "cloud.bolt.rain", low: Measurement(value: 16, unit: UnitTemperature.celsius), high: Measurement(value: 16, unit: UnitTemperature.celsius)),
            WeatherDayForecast(day: "Wednesday", icon: "cloud.bolt.rain", low: Measurement(value: 16, unit: UnitTemperature.celsius), high: Measurement(value: 16, unit: UnitTemperature.celsius)),
            WeatherDayForecast(day: "Thursday", icon: "cloud.bolt.rain", low: Measurement(value: 16, unit: UnitTemperature.celsius), high: Measurement(value: 16, unit: UnitTemperature.celsius)),
            WeatherDayForecast(day: "Friday", icon: "cloud.bolt.rain", low: Measurement(value: 16, unit: UnitTemperature.celsius), high: Measurement(value: 16, unit: UnitTemperature.celsius)),
        ])
    }
}
