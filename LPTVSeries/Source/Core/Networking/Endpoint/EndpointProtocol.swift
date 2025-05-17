//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import Foundation
    
protocol EndpointProtocol {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var url: String { get }
}
