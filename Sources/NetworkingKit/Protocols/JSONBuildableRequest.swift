//
//  JSONBuildableRequest.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 6/18/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

public protocol JSONBuildableRequest: BuildableRequest { }

public extension JSONBuildableRequest {

    public var request: URLRequest? {
        guard let url = url else {
            return nil
        }

        var request = URLRequest(url: url)

        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers

        switch method {
        case .PATCH, .POST:
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            do {
                let bodyObject = parameters.object
                let body = try JSONSerialization.data(withJSONObject: bodyObject, options: [])
                request.httpBody = body
            } catch {
                return nil
            }
        case .CONNECT, .DELETE, .GET, .HEAD, .OPTIONS, .PUT, .TRACE:
            break
        }

        return request
    }

}
