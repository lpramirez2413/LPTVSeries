//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import Foundation
    
enum Endpoint: EndpointProtocol {
    
    case getRecents
    case getShows
    case searchShows
    
    var path: String {
        switch self {
        case .getRecents:
            "/schedule"
        case .getShows:
            "/shows"
        case .searchShows:
            "/search/shows"
        }
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var url: String {
        API.apiPath+path
    }
    
}
