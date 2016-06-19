//
//  URLComponents.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 6/18/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

enum URLComponentsError: ErrorProtocol {

    case PathCouldNotBeEscaped

}

extension URLComponents {

    mutating func append(pathWithString string: String) throws {
        let pathSet = CharacterSet.urlPathAllowed
        guard let encodedString =
            string.addingPercentEncoding(withAllowedCharacters: pathSet) else {
                throw URLComponentsError.PathCouldNotBeEscaped
        }
        let currentPath = path ?? ""
        path = currentPath + encodedString
    }

    mutating func append(queryItems: [URLQueryItem]) {
        let currentQueryItems = self.queryItems ?? []
        self.queryItems = currentQueryItems + queryItems
    }

}
