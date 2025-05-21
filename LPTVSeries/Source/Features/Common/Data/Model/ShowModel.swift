//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import Foundation

struct ShowModel: Decodable {
    let id: Int
    let name: String
    let image: ImageModel?
    let summary: String?
    let rating: RatingModel
    let _embedded: EmbeddedModel?
    
    struct RatingModel: Decodable {
        let average: Double?
    }
    
    struct EmbeddedModel: Decodable {
        let episodes: [EpisodeModel]
    }
}
