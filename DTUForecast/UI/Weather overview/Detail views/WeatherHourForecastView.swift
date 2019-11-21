//
//  WeatherHourForecastView.swift
//  DTUForecast
//
//  Created by Shape on 19/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import SwiftUI

struct WeatherHourlyForecast: Identifiable {
    let id = UUID()
    let time: String
    let icon: String
    let temperature: Measurement<UnitTemperature>
    let isNow: Bool
}

struct WeatherHourForecastView: View {
    let forecast: WeatherHourlyForecast
    
    var body: some View {
        VStack {
            Text(forecast.isNow ? "Now" : forecast.time)
                .padding(5)
                .background(forecast.isNow ? Color(.label) : Color(.clear))
                .foregroundColor(forecast.isNow ? Color(.systemBackground) : Color(.label))
                .cornerRadius(20)
            Image(systemName: forecast.icon)
            Text(forecast.temperature.degreesString)
                .bold()
        }
        .foregroundColor(forecast.isNow ? Color(.label) : Color(.secondaryLabel))
    }
}

struct WeatherHourForecastView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHourForecastView(forecast: WeatherHourlyForecast(time: "9:00", icon: "cloud.bolt.rain", temperature: Measurement(value: 16, unit: UnitTemperature.celsius), isNow: true))
    }
}
