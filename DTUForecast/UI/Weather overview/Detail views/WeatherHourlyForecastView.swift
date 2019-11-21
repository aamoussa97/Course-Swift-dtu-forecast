//
//  WeatherHourlyForecastView.swift
//  DTUForecast
//
//  Created by Shape on 19/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import SwiftUI

struct WeatherHourlyForecastView: View {
    let hourlyForcasts: [WeatherHourlyForecast]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 10) {
                Spacer(minLength: 15)
                ForEach(hourlyForcasts) { forecast in
                    WeatherHourForecastView(forecast: forecast)
                }
                Spacer(minLength: 15)
            }
        }
    }
}

struct WeatherHourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHourlyForecastView(hourlyForcasts: [
            WeatherHourlyForecast(time: "9:00", icon: "cloud.bolt.rain", temperature: Measurement(value: 16, unit: UnitTemperature.celsius), isNow: true),
            WeatherHourlyForecast(time: "10:00", icon: "cloud.bolt.rain", temperature: Measurement(value: 16, unit: UnitTemperature.celsius), isNow: false),
            WeatherHourlyForecast(time: "11:00", icon: "cloud.sun", temperature: Measurement(value: 16, unit: UnitTemperature.celsius), isNow: false),
            WeatherHourlyForecast(time: "12:00", icon: "cloud.sun", temperature: Measurement(value: 16, unit: UnitTemperature.celsius), isNow: false),
            WeatherHourlyForecast(time: "13:00", icon: "cloud.sun", temperature: Measurement(value: 16, unit: UnitTemperature.celsius), isNow: false),
            WeatherHourlyForecast(time: "14:00", icon: "cloud.sun.bolt", temperature: Measurement(value: 16, unit: UnitTemperature.celsius), isNow: false),
        ])
    }
}
