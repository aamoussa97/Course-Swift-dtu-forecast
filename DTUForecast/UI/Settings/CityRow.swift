//
//  CityRow.swift
//  DTUForecast
//
//  Created by Ali Moussa on 21/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import Foundation
import SwiftUI

struct CityRow: View {
    var city: City

    var body: some View {
        HStack {
            Text("\(city.name), \(city.country)")
        }
    }
}

struct CityRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CityRow(city: cityData[0])
            CityRow(city: cityData[1])
        }
    }
}
