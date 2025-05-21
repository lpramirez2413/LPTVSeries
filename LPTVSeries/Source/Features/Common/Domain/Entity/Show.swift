//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
struct Show: Equatable, Hashable {
    let id: Int
    let name: String
    let posterUrl: String?
    let summary: String?
    var isFavorite: Bool
    let rating: Double?
}
