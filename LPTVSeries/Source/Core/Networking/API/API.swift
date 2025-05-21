//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

struct API: APIProtocol {
    static var host: String = "https://api.tvmaze.com"
    static var api: String = ""

    static var apiPath: String {
        return host + api
    }
}
