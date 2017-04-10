//
//  RequestParameters.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 6/18/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

public enum RequestParameters {
    case keyValue([String: String])
    case json([String: Any])

    public var object: Any {
        switch self {
        case let .keyValue(keyValueDictionary):
            return keyValueDictionary
        case let .json(jsonDictionary):
            return jsonDictionary
        }
    }

    public var queryItems: [URLQueryItem] {
        switch self {
        case let .keyValue(keyValueDictionary):
            return keyValueDictionary.map { URLQueryItem(name: $0, value: $1) }
        case let .json(jsonDictionary):
            return jsonDictionary.flatMap { URLQueryItem(name: $0, value: $1) }
        }
    }
}
