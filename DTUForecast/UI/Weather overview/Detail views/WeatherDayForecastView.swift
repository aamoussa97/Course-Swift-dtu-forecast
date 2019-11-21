//
//  WeatherDayForecastView.swift
//  DTUForecast
//
//  Created by Shape on 19/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import SwiftUI

struct WeatherDayForecast: Identifiable {
    let id = UUID()
    let day: String
    let icon: String
    let low: Measurement<UnitTemperature>
    let high: Measurement<UnitTemperature>
}

struct WeatherDayForecastView: View {
    let forecast: WeatherDayForecast
    
    var body: some View {
        HStack(spacing: 10) {
            Text(forecast.day)
                .bold()
            Spacer()
            Image(systemName: forecast.icon)
                .foregroundColor(Color(hex: "425c86"))
            Spacer()
            Text(forecast.low.degreesString)
                .bold()
                .padding()
            Text(forecast.high.degreesString)
                .bold()
        }
        .padding([.leading, .trailing], 5)
    }
}

struct WeatherDayForecastView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDayForecastView(forecast: WeatherDayForecast(day: "Monday", icon: "cloud.bolt.rain", low: Measurement(value: 16, unit: UnitTemperature.celsius), high: Measurement(value: 16, unit: UnitTemperature.celsius)))
    }
}
