//
//  City.swift
//  DTUForecast
//
//  Created by Ali Moussa on 21/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import Foundation
import SwiftUI

struct City: Hashable, Codable, Identifiable {
    var id: Int
    let name: String
    let country: String
}
