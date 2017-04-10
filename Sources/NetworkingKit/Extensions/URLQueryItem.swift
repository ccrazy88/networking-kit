//
//  URLQueryItem.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 7/14/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

extension URLQueryItem {
    init?(name: String, value: Any) {
        if let value = value as? String {
            self.init(name: name, value: value)
        } else if let JSONValue = value as? [String: Any],
            let transformedValue = String(JSONObject: JSONValue) {
            self.init(name: name, value: transformedValue)
        } else {
            return nil
        }
    }
}
