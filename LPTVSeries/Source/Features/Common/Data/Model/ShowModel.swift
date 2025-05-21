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
    
    struct RatingModel: Decodable {
        let average: Double?
    }
}
