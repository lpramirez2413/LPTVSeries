//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import Foundation

struct EpisodeModel: Decodable {
    let id: Int
    let name: String
    let image: String?
    let show: ShowModel
    let summary: String?
}

struct ShowModel: Decodable {
    let id: Int
    let genres: [String]
}
