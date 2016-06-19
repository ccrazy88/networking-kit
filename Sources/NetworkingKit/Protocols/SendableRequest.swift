//
//  SendableRequest.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 6/18/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

public typealias SendableRequestHandler<T> =
    (innerHandler: () throws -> (statusCode: Int, data: T)) -> Void

public protocol SendableRequest: BuildableRequest, ResponseParser {

    @discardableResult
    func sendRequest(withSession session: URLSession,
                     handler: SendableRequestHandler<ResponseType>) -> URLSessionTask?

}

public extension SendableRequest {

    @discardableResult
    public func sendRequest(withSession session: URLSession,
                            handler: SendableRequestHandler<ResponseType>) -> URLSessionTask? {
        guard let request = request else {
            handler { throw NetworkingKitError.RequestMalformed }
            return nil
        }

        let task = session.dataTask(with: request) { data, response, error in
            do {
                let (data, response) = try self.response(fromData: data,
                                                         response: response,
                                                         error: error)
                switch response.statusCode {
                case 401:
                    handler { throw NetworkingKitError.HTTPStatusUnauthorized }
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

    private func response(fromData data: Data?,
                          response: URLResponse?,
                          error: NSError?) throws -> (data: Data, response: HTTPURLResponse) {
        if let data = data, response = response as? HTTPURLResponse {
            return (data, response)
        } else if let error = error {
            let errorMessage = error.localizedDescription
            throw NetworkingKitError.ResponseContainsErrorMessage(message: errorMessage)
        } else {
            throw NetworkingKitError.ResponseMalformed
        }
    }

}
