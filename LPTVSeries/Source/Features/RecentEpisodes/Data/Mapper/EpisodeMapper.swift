//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
struct EpisodeMapper {
    
    /// Transform a collection of `EpisodeModel` into a collection of `Episode`
    static func mapEpisodes(from model: [EpisodeModel], favoriteIDs: Set<Int>) -> [Episode] {
        return model.map {
            return .init(
                id: $0.id,
                name: $0.name,
                posterUrl: $0.image?.medium,
                isFavorite: favoriteIDs.contains($0.id))
        }
    }
}
