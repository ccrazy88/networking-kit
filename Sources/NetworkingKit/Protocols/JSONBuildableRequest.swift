//
//  JSONBuildableRequest.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 6/18/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

public protocol JSONBuildableRequest: BuildableRequest, Request {}

public extension JSONBuildableRequest {
    public var request: URLRequest? {
        guard let url = url else {
            return nil
        }

        var request = URLRequest(url: url)

        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers

        switch method {
        case .patch, .post:
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            do {
                let bodyObject = parameters.object
                let body = try JSONSerialization.data(withJSONObject: bodyObject, options: [])
                request.httpBody = body
            } catch {
                return nil
            }
        case .connect, .delete, .get, .head, .options, .put, .trace:
            break
        }

        return request
    }
}
