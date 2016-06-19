//
//  StringParser.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 6/18/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

public protocol StringParser: ResponseParser { }

public extension StringParser {

    public func parseResponse(data: Data) throws -> String {
        guard let string = String(data: data, encoding: .utf8) else {
            throw NetworkingKitError.ResponseCouldNotBeParsed
        }
        return string
    }

}
