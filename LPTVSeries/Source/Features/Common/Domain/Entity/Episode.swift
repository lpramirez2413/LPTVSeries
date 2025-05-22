//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
struct Episode: Equatable, Hashable {
    let id: Int
    let name: String
    let posterUrl: String?
    let isFavorite: Bool?
    let number: Int
    let season: Int
    let summary: String?
}
