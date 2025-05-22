//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

struct FavoriteMapper {
    
    /// Transform a collection of `FavoriteShowEntity` into a collection of `Favorite`
    static func mapFavoriteShows(from model: [FavoriteShowEntity]) -> [Favorite] {
        model.map {
            .init(
                id: Int($0.id),
                posterUrl: $0.imageUrl,
                name: $0.name,
                rating: $0.rating,
                summary: $0.summary)
        }
    }
}
