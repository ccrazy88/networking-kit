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
        guard
            let baseURL = baseURL,
            var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
                return nil
        }

        do {
            try urlComponents.append(pathWithString: path)
        } catch {
            return nil
        }

        switch method {
        case .PATCH, .POST:
            break
        case .CONNECT, .DELETE, .GET, .HEAD, .OPTIONS, .PUT, .TRACE:
            urlComponents.append(queryItems: parameters.queryItems)
        }

        return urlComponents.url
    }

}
