//
//  WeatherOverviewView.swift
//  DTUForecast
//
//  Created by Shape on 19/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import SwiftUI

private let paddingValue: CGFloat = 18.0

struct WeatherOverviewView<Model>: View where Model: WeatherModel {
    @ObservedObject var viewModel: Model
    @State private var showingSettings = false
    
    let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
            
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 30) {
                    Text(DFDateFormatter.fullDateFormatter.string(from: Date()))
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding([.leading, .trailing], paddingValue)
                    
                    viewModel.currentWeatherValues.map {
                        WeatherCurrentView(values: $0)
                            .padding([.leading, .trailing], paddingValue)
                    }
                    .onReceive(timer) { _ in
                        self.viewModel.refreshWeather(cityName: "odense")
                        self.viewModel.cityName = "odense"
                    }
                    
                    WeatherHourlyForecastView(hourlyForcasts: viewModel.hourlyForecasts)
                    
                    if !viewModel.weatherProperties.isEmpty {
                        WeatherPropertiesView(weatherProperties: viewModel.weatherProperties)
                    }
                    
                    WeatherDaysForecastListView(days: viewModel.dayForecasts)
                        .padding([.leading, .trailing], paddingValue)
                    
                    Spacer()
                }
            }
            .navigationBarTitle(viewModel.cityName.capitalized)
            
            .navigationBarItems(trailing: HStack(spacing: 30) {
                Button(action: {
                    self.viewModel.refreshWeather(cityName: "odense")
                    self.viewModel.cityName = "odense"
                    
                }, label: { Image(systemName: "arrow.clockwise.circle.fill").imageScale(.large).foregroundColor(Color(.label))} )
                Button(action: {
                    self.showingSettings.toggle()
                    
                }, label: { Image(systemName: "location.circle.fill").imageScale(.large).foregroundColor(Color(.label))} )
            })
            
            }.sheet(isPresented: $showingSettings) {
                CitySettingsView(showing: self.$showingSettings)
            }
        }
    }


struct WeatherOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherOverviewView(viewModel: DummyWeatherOverviewViewModel())
            .environment(\.colorScheme, .light) // Change to .dark to previews in dark mode
    }
}
