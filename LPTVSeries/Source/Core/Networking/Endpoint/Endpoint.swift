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
    case getPeople
    case searchPeople
    case getPersonShows(personId: Int)
    
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
        case .getPeople:
            "/people"
        case .getPersonShows(let personId):
            "/people/\(personId)/castcredits"
        case .searchPeople:
            "/search/people"
        }
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var url: String {
        API.apiPath+path
    }
    
}
