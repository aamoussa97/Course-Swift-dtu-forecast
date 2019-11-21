//
//  WeatherPropertiesView.swift
//  DTUForecast
//
//  Created by Shape on 19/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import SwiftUI

struct WeatherPropertiesView: View {
    let weatherProperties: [WeatherProperty]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Spacer(minLength: 18)
                ForEach(weatherProperties) {
                    WeatherPropertyView(
                        type: $0.name,
                        value: $0.formattedValue,
                        background: $0.color,
                        image: $0.icon,
                        additionalValue: $0.additionalValue
                    )
                }
                Spacer(minLength: 18)
            }
        }
    }
}

struct WeatherPropertiesView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherPropertiesView(weatherProperties: [
            WeatherProperty(
                id: .wind,
                name: "Wind",
                formattedValue: "",
                additionalValue: "",
                color: .purple,
                icon: "wind"
            ),
            WeatherProperty(
                id: .wind,
                name: "Wind",
                formattedValue: "",
                additionalValue: "",
                color: .purple,
                icon: "wind"
            ),
            WeatherProperty(
                id: .wind,
                name: "Wind",
                formattedValue: "",
                additionalValue: "",
                color: .purple,
                icon: "wind"
            )
        ])
    }
}
