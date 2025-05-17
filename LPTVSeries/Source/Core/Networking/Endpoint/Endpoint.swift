//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import Foundation
    
enum Endpoint: EndpointProtocol {
    
    case getRecents
    
    var path: String {
        switch self {
        case .getRecents:
            "/schedule"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getRecents:
                .get
        }
    }
    
    var url: String {
        switch self {
        case .getRecents:
            API.apiPath+path
        }
    }
    
}
