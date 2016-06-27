//
//  DataParser.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 6/26/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

public protocol DataParser: ResponseParser { }

public extension DataParser {

    public func parseResponse(data: Data) throws -> Data {
        return data
    }

}
