//
//  URLComponents.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 6/18/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

extension URLComponents {
    mutating func append(queryItems: [URLQueryItem]) {
        let currentQueryItems = self.queryItems ?? []
        self.queryItems = currentQueryItems + queryItems
    }
}
