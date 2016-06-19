//
//  Request.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 6/18/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

public protocol Request {

    var baseURL: URL? { get }
    var method: RequestMethod { get }
    var headers: [String : String] { get }
    var path: String { get }
    var parameters: RequestParameters { get }

}

public extension Request {

    public var method: RequestMethod { return .GET }
    public var headers: [String : String] { return [:] }
    public var path: String { return "" }
    public var parameters: RequestParameters { return .KeyValue([:]) }

}
