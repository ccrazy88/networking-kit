//
//  JSONObjectParser.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 6/18/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

public protocol JSONObjectParser: ResponseParser {}

public extension JSONObjectParser {
    public func parseResponse(data: Data) throws -> [String: Any] {
        guard let object = try? JSONSerialization.jsonObject(with: data, options: []),
            let dictionary = object as? [String: Any] else {
            throw NetworkingKitError.responseCouldNotBeParsed
        }
        return dictionary
    }
}
