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
            return keyValueDictionary.map { URLQueryItem(name: $0, value: $1) }
        case .JSON(let jsonDictionary):
            return jsonDictionary.flatMap { URLQueryItem(name: $0, value: $1) }
        }
    }

}
