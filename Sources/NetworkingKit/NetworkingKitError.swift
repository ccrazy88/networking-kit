//
//  NetworkingKitError.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 6/18/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

public enum NetworkingKitError: Error {
    case fallback
    case requestMalformed
    case responseMalformed
    case responseCouldNotBeParsed
    case responseContainsErrorMessage(message: String)
    case httpStatusUnauthorized

    public var localizedDescription: String {
        switch self {
        case .fallback, .requestMalformed, .responseMalformed, .responseCouldNotBeParsed:
            return NSLocalizedString("Sorry, something bad happened! Please try again.",
                                     comment: "Generic request error message")
        case let .responseContainsErrorMessage(message):
            return message
        case .httpStatusUnauthorized:
            return NSLocalizedString("You need to be authenticated to execute this request.",
                                     comment: "Unauthorized error message")
        }
    }
}
