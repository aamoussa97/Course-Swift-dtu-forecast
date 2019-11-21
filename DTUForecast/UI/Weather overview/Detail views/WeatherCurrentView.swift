//
//  WeatherCurrentView.swift
//  DTUForecast
//
//  Created by Shape on 19/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import SwiftUI

struct WeatherCurrentView: View {
    struct Values {
        let currentTemperature: Measurement<UnitTemperature>
        let currentTemperatureMin: Measurement<UnitTemperature>
        let currentTemperatureMax: Measurement<UnitTemperature>
        let description: String
    }

    let values: Values
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text(values.currentTemperature.degreesString)
                .font(.system(size: 65))
            VStack(alignment: .leading) {
                Text(values.currentTemperatureMin.degreesString + " - " + values.currentTemperatureMax.degreesString)
                    .font(.system(size: 16))
                    .bold()
                Text(values.description.capitalized)
                    .font(.system(size: 16))
                    .bold()
            }
            .padding(.bottom, 10)
        }
    }
}

struct WeatherCurrentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCurrentView(values:
            WeatherCurrentView.Values(
                currentTemperature: Measurement(value: 16, unit: UnitTemperature.celsius),
                currentTemperatureMin: Measurement(value: 16, unit: UnitTemperature.celsius),
                currentTemperatureMax: Measurement(value: 16, unit: UnitTemperature.celsius),
                description: "Sunny"
            )
        )
    }
}
