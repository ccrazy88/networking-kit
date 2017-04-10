//
//  ResponseParser.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 6/18/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

public protocol ResponseParser {
    associatedtype ResponseType
    func parseResponse(data: Data) throws -> ResponseType
}
