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
    
    var body: some View {
        Button(action: {
            self.showing = false
        }) {
            Text("Change city")
        }
    }
}

struct CitySettingsView_Previews: PreviewProvider {
    @State static var showing = true
    static var previews: some View {
        CitySettingsView(showing: $showing)
    }
}
