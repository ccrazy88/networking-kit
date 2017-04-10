//
//  SendableRequest.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 6/18/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

public typealias SendableRequestHandler<T> =
    (_ innerHandler: () throws -> (statusCode: Int, data: T)) -> Void

public protocol SendableRequest: ResponseParser {
    @discardableResult
    func send(with session: URLSession,
              handler: SendableRequestHandler<ResponseType>) -> URLSessionTask?
}

public extension SendableRequest where Self: BuildableRequest {
    @discardableResult
    public func send(with session: URLSession,
                     handler: @escaping SendableRequestHandler<ResponseType>) -> URLSessionTask? {
        guard let request = request else {
            handler { throw NetworkingKitError.requestMalformed }
            return nil
        }

        let task = session.dataTask(with: request) { data, response, error in
            do {
                let (data, response) =
                    try self.response(from: data, response: response, error: error)
                switch response.statusCode {
                case 401:
                    handler { throw NetworkingKitError.httpStatusUnauthorized }
                default:
                    let parsedData = try self.parseResponse(data: data)
                    handler { return (response.statusCode, parsedData) }
                }
            } catch let error {
                handler { throw error }
            }
        }

        task.resume()
        return task
    }

    private func response(from data: Data?,
                          response: URLResponse?,
                          error: Error?) throws -> (data: Data, response: HTTPURLResponse) {
        if let data = data, let response = response as? HTTPURLResponse {
            return (data, response)
        } else if let error = error {
            let errorMessage = error.localizedDescription
            throw NetworkingKitError.responseContainsErrorMessage(message: errorMessage)
        } else {
            throw NetworkingKitError.responseMalformed
        }
    }
}
