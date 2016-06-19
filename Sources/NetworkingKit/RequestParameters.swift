//
//  RequestParameters.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 6/18/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

public enum RequestParameters {

    case KeyValue([String : String])
    case JSON([String : AnyObject])

    public var object: AnyObject {
        switch self {
        case .KeyValue(let keyValueDictionary):
            return keyValueDictionary
        case .JSON(let jsonDictionary):
            return jsonDictionary
        }
    }

    public var queryItems: [URLQueryItem] {
        switch self {
        case .KeyValue(let keyValueDictionary):
            return keyValueDictionary.map {
                return URLQueryItem(name: $0, value: $1)
            }
        case .JSON(let jsonDictionary):
            let queryItems = jsonDictionary.flatMap { key, value -> URLQueryItem? in
                if let value = value as? String {
                    return URLQueryItem(name: key, value: value)
                } else if let
                    jsonValue = value as? [String : AnyObject],
                    transformedValue = String(jsonObject: jsonValue) {
                        return URLQueryItem(name: key, value: transformedValue)
                }
                return nil
            }
            return queryItems
        }
    }

}
