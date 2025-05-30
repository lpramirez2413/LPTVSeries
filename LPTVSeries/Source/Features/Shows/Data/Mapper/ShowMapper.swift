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
                rating: $0.rating.average,
                premiered: $0.premiered?.toDate(format: "yyyy-MM-dd"),
                genres: $0.genres,
                schedule: convertSchedule($0.schedule)
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
                    season: episodeModel.season,
                    summary: episodeModel.summary
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
            episodes: episodes,
            premiered: model.premiered?.toDate(format: "yyyy-MM-dd"),
            genres: model.genres,
            schedule: convertSchedule(model.schedule)
        )
    }
    
    // MARK: Helper functions
    
    private static func convertSchedule(_ schedule: ShowModel.Schedule?) -> String? {
        guard let schedule else {
            return nil
        }
        
        let formattedTime = schedule.time?.toReadableTime() ?? ""
        let formattedDays = schedule.days.formattedDayDescription()
        
        guard !formattedDays.isEmpty else {
            return formattedTime.isEmpty ? "Schedule not available" : "At \(formattedTime)"
        }
        
        return "\(formattedDays) at \(formattedTime)"
    }

}
