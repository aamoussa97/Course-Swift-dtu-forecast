//
//  CityData.swift
//  DTUForecast
//
//  Created by Ali Moussa on 21/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import Foundation
import SwiftUI

let cityData: [City] = load("citylist_openweathermap.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
