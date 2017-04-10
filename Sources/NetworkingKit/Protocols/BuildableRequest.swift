//
//  BuildableRequest.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 6/18/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

public protocol BuildableRequest {
    var request: URLRequest? { get }
}

public extension BuildableRequest where Self: Request {
    public var url: URL? {
        guard let baseURL = baseURL,
            var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
            return nil
        }

        urlComponents.path += path

        switch method {
        case .patch, .post:
            break
        case .connect, .delete, .get, .head, .options, .put, .trace:
            urlComponents.append(queryItems: parameters.queryItems)
        }

        return urlComponents.url
    }
}
