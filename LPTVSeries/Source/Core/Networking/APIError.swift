//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
enum APIError: Error, Equatable {
    
    case invalidURL
    case invalidRequest
    case invalidResponse
    case failureResponse(statusCode: Int)
    case unknown
    
    static func == (lhs: APIError, rhs: APIError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidURL, .invalidURL):
            return true
        case (.invalidRequest, .invalidRequest):
            return true
        case (.invalidResponse, .invalidResponse):
            return true
        case let (.failureResponse(lhsCode), .failureResponse(rhsCode)):
            return lhsCode == rhsCode
        case (.unknown, .unknown):
            return true
        default:
            return false
        }
    }
}
