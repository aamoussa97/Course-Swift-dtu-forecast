//
//  DFJSONDecoder.swift
//  DTUForecast
//
//  Created by Shape on 20/11/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import Foundation

struct DFJSONDecoder {
    var jsonDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }
}
