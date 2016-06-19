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

extension Request {

    var method: RequestMethod { return .GET }
    var headers: [String : String] { return [:] }
    var path: String { return "" }
    var parameters: RequestParameters { return .KeyValue([:]) }

}
