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
    let episodes: [Episode]
    
    init(id: Int, name: String, posterUrl: String?, summary: String?, isFavorite: Bool, rating: Double?, episodes: [Episode] = []) {
        self.id = id
        self.name = name
        self.posterUrl = posterUrl
        self.summary = summary
        self.isFavorite = isFavorite
        self.rating = rating
        self.episodes = episodes
    }
    
}
