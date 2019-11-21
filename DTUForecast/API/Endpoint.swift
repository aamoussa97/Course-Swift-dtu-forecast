//
//  Endpoint.swift
//  DTUForecast
//
//  Created by Jakob Vinther-Larsen on 28/10/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import Foundation

struct Endpoint<Value> where Value: Decodable {
    enum Method: String {
        case get, post, put, patch
    }
    
    public enum ContentType: String {
        case json = "application/json"
    }
    
    let request: URLRequest
    
    init(request: URLRequest) {
        self.request = request
    }
    
    init(method: Method = .get, url: URL, accept: ContentType? = nil, contentType: ContentType? = nil, body: Data? = nil, headers: [String : String] = [:], query: [String : String]) {
        
        var comps = URLComponents(string: url.absoluteString)!
        comps.queryItems = comps.queryItems ?? []
        comps.queryItems!.append(contentsOf: query.map { URLQueryItem(name: $0.0, value: $0.1) })
        var request = URLRequest(url: comps.url!)
        if let a = accept {
            request.setValue(a.rawValue, forHTTPHeaderField: "Accept")
        }
        if let ct = contentType {
            request.setValue(ct.rawValue, forHTTPHeaderField: "Content-Type")
        }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }

        request.httpMethod = method.string

        // body *needs* to be the last property that we set, because of this bug: https://bugs.swift.org/browse/SR-6687
        request.httpBody = body
        self.request = request
    }
    
    init(json method: Method, url: URL, body: Data? = nil, headers: [String : String] = [:], query: [String : String] = [:]) {
        self.init(method: method, url: url, accept: .json, contentType: .json, body: body, headers: headers, query: query)
    }
    
    func modifyHeaders(headers: [String : String]) -> Endpoint<Value> {
        var request = self.request
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        return .init(request: request)
    }
}

extension Endpoint.Method {
    var string: String {
        rawValue.uppercased()
    }
}
