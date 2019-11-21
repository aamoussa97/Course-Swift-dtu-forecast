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
    //@ObservedObject var viewModel: WeatherModel
    
    var body: some View {
        NavigationView {
        
            List(cityData) { city in
                NavigationLink(destination: Text("City")) {//CityDetail(city: city)) {
                    CityRow(city: city)
                }
            }
           
            /*
            List(cityData) { city in
                CityRow(city: city)
            }*/
            .navigationBarTitle("City")
        }
    }
}

/*
func refreshChosenCity(chosenCity: String, viewModel: WeatherModel) {
    //viewModel.refreshWeather(cityName: chosenCity)
    //WeatherOverviewViewModel.refreshWeather(chosenCity)
    //viewModel.refreshWeather(cityName: chosenCity)
    //WeatherOverviewView(viewModel: DummyWeatherOverviewViewModel())
}
*/

struct CitySettingsView_Previews: PreviewProvider {
    @State static var showing = true
    static var previews: some View {
        CitySettingsView(showing: $showing)
    }
}
