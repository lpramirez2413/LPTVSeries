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
    case getShowDetails(showId: Int)
    case getEpisodeDetails(episodeId: Int)
    
    var path: String {
        switch self {
        case .getRecents:
            "/schedule"
        case .getShows:
            "/shows"
        case .searchShows:
            "/search/shows"
        case .getShowDetails(let showId):
            "/shows/\(showId)"
        case .getEpisodeDetails(let episodeId):
            "/episodes/\(episodeId)"
        }
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var url: String {
        API.apiPath+path
    }
    
}
