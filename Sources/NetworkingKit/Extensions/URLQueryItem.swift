//
//  URLQueryItem.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 7/14/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

extension URLQueryItem {

    init?(name: String, value: AnyObject) {
        if let value = value as? String {
            self.init(name: name, value: value)
        } else if let
            jsonValue = value as? [String : AnyObject],
            transformedValue = String(jsonObject: jsonValue) {
                self.init(name: name, value: transformedValue)
        }
        return nil
    }

}
