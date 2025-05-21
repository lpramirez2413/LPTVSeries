//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
struct ShowMapper {
    
    /// Transform a collection of `ShowModel` into a collection of `Show`
    static func mapShows(from model: [ShowModel], favoriteIDs: Set<Int>) -> [Show] {
        return model.map {
            return .init(
                id: $0.id,
                name: $0.name,
                posterUrl: $0.image?.medium,
                summary: $0.summary,
                isFavorite: favoriteIDs.contains($0.id),
                rating: $0.rating.average
            )
        }
    }

}
