//
//  CitySettingsView.swift
//  DTUForecast
//
//  Created by Shape on 19/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import SwiftUI

struct CitySettingsView: View {
    @Binding var showing: Bool
    @Binding var cityName: String
    
    var body: some View {
        NavigationView {
            
            List(cityData) { city in
                //CityRow(city: city)
                
                HStack {
                    Button(action: {
                        self.cityName = city.name
                        self.showing = false
                    }, label: {
                        Text("\(city.name), \(city.country)")
                    })
                    Spacer()
                }
            }
            .navigationBarTitle("City")
        }
    }
}

struct CitySettingsView_Previews: PreviewProvider {
    @State static var showing = true
    @State static var cityname = "Copenhagen"
    
    static var previews: some View {
        CitySettingsView(showing: $showing, cityName: $cityname)
    }
}
