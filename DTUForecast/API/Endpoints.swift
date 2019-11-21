//
//  Endpoints.swift
//  DTUForecast
//
//  Created by Jakob Vinther-Larsen on 29/10/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import Foundation

struct AppId {
    let value: String = "" // Add API key here
}

private let baseurl = URL(string: "https://api.openweathermap.org/data/2.5/")!

extension OpenWeather.CurrentWeather {
    static func request(forCityName name: String) -> (AppId) -> Endpoint<OpenWeather.CurrentWeather> {
        return { auth in
            let url = baseurl.appendingPathComponent("weather")
            return .init(json: .get, url: url, query: [
                "q" : name,
                "APPID" : auth.value
            ])
        }
    }
}

extension OpenWeather.WeatherForecast {
    static func request(forCityName name: String) -> (AppId) -> Endpoint<OpenWeather.WeatherForecast> {
        return { auth in
            let url = baseurl.appendingPathComponent("forecast")
            return .init(json: .get, url: url, query: [
                "q" : name,
                "APPID" : auth.value
            ])
        }
    }
}
