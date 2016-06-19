//
//  NetworkingKitError.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 6/18/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

public enum NetworkingKitError: ErrorProtocol {

    case Fallback
    case RequestMalformed
    case ResponseMalformed
    case ResponseCouldNotBeParsed
    case ResponseContainsErrorMessage(message: String)
    case HTTPStatusUnauthorized

    public var localizedDescription: String {
        switch self {
        case .Fallback, .RequestMalformed, .ResponseMalformed, .ResponseCouldNotBeParsed:
            return NSLocalizedString(
                "Sorry, something bad happened! Please try again.",
                comment: "Generic request error message"
            )
        case .ResponseContainsErrorMessage(let message):
            return message
        case .HTTPStatusUnauthorized:
            return NSLocalizedString(
                "You need to be authenticated to execute this request.",
                comment: "Unauthorized error message"
            )
        }
    }

}
