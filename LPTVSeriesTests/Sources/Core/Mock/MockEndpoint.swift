//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

@testable import LPTVSeries
    
enum MockEndpoint: EndpointProtocol {
    case fooGet
    case fooPost
    
    var path: String { "foo" }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .fooGet:
            return .get
        case .fooPost:
            return .post
        }
    }
    
    var url: String { "foo.url" }
}
