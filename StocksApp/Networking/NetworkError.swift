//
//  NetworkError.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidRequest
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case error4xx(_ code: Int)
    case serverError
    case error5xx(_ code: Int)
    case decodingError
    case urlSessionFailed(_ error: URLError)
    case unknownError
    
    // MARK: - Initializers
    
    init(statusCode: Int) {
        switch statusCode {
        case 400:
            self = .badRequest
        case 401:
            self = .unauthorized
        case 403:
            self = .forbidden
        case 404:
            self = .notFound
        case 402, 405...499:
            self = .error4xx(statusCode)
        case 500:
            self = .serverError
        case 501...599:
            self = .error5xx(statusCode)
        default:
            self = .unknownError
        }
    }
    
    init(error: Error) {
        switch error {
        case is Swift.DecodingError:
            self = .decodingError
        case let urlError as URLError:
            self = .urlSessionFailed(urlError)
        case let error as NetworkError:
            self = error
        default:
            self = .unknownError
        }
    }
}
