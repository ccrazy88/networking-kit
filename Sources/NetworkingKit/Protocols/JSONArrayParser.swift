//
//  JSONArrayParser.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 6/18/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

public protocol JSONArrayParser: ResponseParser { }

public extension JSONArrayParser {

    public func parseResponse(data: Data) throws -> [[String : AnyObject]] {
        guard let
            object = try? JSONSerialization.jsonObject(with: data, options: []),
            array = object as? [[String : AnyObject]] else {
                throw NetworkingKitError.ResponseCouldNotBeParsed
        }
        return array
    }

}
