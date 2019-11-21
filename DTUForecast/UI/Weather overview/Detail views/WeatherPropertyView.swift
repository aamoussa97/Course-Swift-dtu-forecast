//
//  WeatherPropertyView.swift
//  DTUForecast
//
//  Created by Jakob Vinther-Larsen on 29/10/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import SwiftUI
import UIKit

struct WeatherPropertyView: View {
    let type: String
    let value: String
    let background: Color
    let image: String
    let additionalValue: String?

    var body: some View {
        VStack() {
            HStack(spacing: 2) {
                Image(systemName: image)
                    .frame(width: 25, height: 25, alignment: Alignment.center)
                additionalValue.map {
                    Text($0.uppercased())
                        .font(Font.body)
                        .bold()
                }
            }
            .padding([.top, .leading, .trailing])
            Text(type)
                .font(.footnote)
                .padding(.horizontal)
            Text(value)
                .font(.body)
                .frame(minWidth: 50)
                .padding([.leading, .bottom, .trailing])
        }
        .frame(width: 100, height: 110)
        .foregroundColor(.white)
        .background(background)
        .cornerRadius(20)
    }
}

struct WeatherPropertyView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(alignment: VerticalAlignment.center) {
            WeatherPropertyView(
                type: "thing",
                value: {
                    let measurement = Measurement(value: 13, unit: UnitSpeed.metersPerSecond)
                    let formatted = MeasurementFormatter().string(from: measurement)
                    
                    return formatted
                }(),
                background: .purple,
                image: "wind",
                additionalValue: "sv"
            )
            
            WeatherPropertyView(
                type: "thing thing",
                value: "1%",
                background: .red,
                image: "waveform",
                additionalValue: nil
            )
            
            WeatherPropertyView(
                type: "thing",
                value: {
                    let measurement = Measurement(value: 13, unit: UnitSpeed.metersPerSecond)
                    let formatted = MeasurementFormatter().string(from: measurement)
                    
                    return formatted
                }(),
                background: .red,
                image: "gauge",
                additionalValue: nil
            )
        }
    }
}
