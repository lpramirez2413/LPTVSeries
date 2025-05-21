//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
struct EpisodeMapper {
    
    /// Transform a collection of `EpisodeModel` into a collection of `Episode`
    static func mapEpisodes(from model: [EpisodeModel], favoriteIDs: Set<Int>? = nil) -> [Episode] {
        return model.map {
            var isFavorite: Bool?
            if let favoriteIDs {
                isFavorite = favoriteIDs.contains($0.id)
            }
            
            return .init(
                id: $0.id,
                name: $0.name,
                posterUrl: $0.image?.medium,
                isFavorite: isFavorite,
                number: $0.number,
                season: $0.season)
        }
    }
    
    static func mapEpisode(from model: EpisodeModel) -> Episode {
        .init(
            id: model.id,
            name: model.name,
            posterUrl: model.image?.medium,
            isFavorite: nil,
            number: model.number,
            season: model.season
        )
    }
}
