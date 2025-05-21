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
    
    static func mapShow(from model: ShowModel, favoriteIDs: Set<Int>) -> Show {
        var episodes: [Episode] = []
        if let embededEpisodes = model._embedded?.episodes {
            episodes = embededEpisodes.map { episodeModel in
                Episode(
                    id: episodeModel.id,
                    name: episodeModel.name,
                    posterUrl: episodeModel.image?.medium,
                    isFavorite: nil,
                    number: episodeModel.number,
                    season: episodeModel.season
                )
            }
        }
        
        return .init(
            id: model.id,
            name: model.name,
            posterUrl: model.image?.medium,
            summary: model.summary,
            isFavorite: favoriteIDs.contains(model.id),
            rating: model.rating.average,
            episodes: episodes
        )
    }

}
