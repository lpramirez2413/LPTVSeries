//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
enum AuthenticationError: Error {
    case userDisabled
    case failed

    var errorDescription: String? {
        switch self {
        case .userDisabled:
            return "Go to settings to enable authentication"
        case .failed:
            return "Authentication failed. Please try again."
        }
    }
}
