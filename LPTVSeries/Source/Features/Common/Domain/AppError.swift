//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import Foundation

enum AppError: Error, Equatable {
    case networkUnavailable
    case notFound
    case serverError
    case unknown
}

extension Error {
    var asAppError: AppError {
        if let apiError = self as? APIError {
            switch apiError {
            case .failureResponse(let statusCode):
                switch statusCode {
                case 404: return .notFound
                case 500...599: return .serverError
                default: return .unknown
                }
            default:
                return .unknown
            }
        }
        
        if let urlError = self as? URLError, urlError.code == .notConnectedToInternet {
            return .networkUnavailable
        }
        
        return .unknown
    }
}
