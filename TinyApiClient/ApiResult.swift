//
//  ApiResult.swift
//  TinyApiClient
//
//  Created by Daniel Lozano on 11/15/16.
//  Copyright © 2016 Daniel Lozano. All rights reserved.
//

import Foundation

public struct Metadata {

    public let pagination: PaginationInfo?

    public let headers: JSONDictionary?

    public let other: JSONDictionary?

}

public struct PaginationInfo {

    public var perPage: Int

    public var totalPages: Int

    public var totalObjects: Int

}

public enum ApiError: Error {

    // MARK: - API Errors

    case clientError(ErrorMetadata)

    case serverError(ErrorMetadata)

    case notFound(ErrorMetadata)

    case invalidToken(ErrorMetadata)

    case invalidCredentials(ErrorMetadata)

    // MARK: - Local, Unknown errors

    case localError(Error)

    case cancelled

    case unexpectedResponse(Any)

    case unknownError

}

public struct ErrorMetadata {

    public let statusCode: Int

    public let errorMessages: [String]?

}

public enum ApiResult<T> {

    case success(resource: T, meta: Metadata)
    
    case error(ApiError)
    
}
