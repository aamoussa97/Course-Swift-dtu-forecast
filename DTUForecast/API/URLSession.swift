//
//  URLSession.swift
//  DTUForecast
//
//  Created by Jakob Vinther-Larsen on 28/10/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import Foundation
import Combine

extension URLSession {
    func decodedTaskPublisher<Value>(for endpoint: Endpoint<Value>, decoder: JSONDecoder = DFJSONDecoder().jsonDecoder) -> AnyPublisher<(value: Value, response: URLResponse), Error> {
        dataTaskPublisher(for: endpoint.request)
            .tryMap { (next: (data: Data, response: URLResponse)) -> (Value, URLResponse) in
                let value = try decoder.decode(Value.self, from: next.data)
                return (value, next.response)
            }
            .eraseToAnyPublisher()
    }
}
