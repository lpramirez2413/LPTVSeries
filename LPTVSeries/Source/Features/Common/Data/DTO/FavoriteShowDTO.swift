//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    

import Foundation

struct FavoriteShowDTO {
    let id: Int
    let name: String
    let imageUrl: String?
    let rating: Double
    let summary: String?
    
    init(from show: Show) {
        self.id = show.id
        self.name = show.name
        self.imageUrl = show.posterUrl
        self.rating = show.rating ?? 0
        self.summary = show.summary
    }
}
