//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import Foundation

struct EpisodeModel: Decodable {
    let id: Int
    let name: String
    let image: ImageModel?
    let show: ShowModel?
    let number: Int
    let season: Int
    let summary: String?
}
