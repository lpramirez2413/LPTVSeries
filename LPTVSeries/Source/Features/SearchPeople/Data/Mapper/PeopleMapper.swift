//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
struct PeopleMapper {
    
    /// Transform a collection of `PersonMapper` into a collection of `Person`
    ///
    static func mapPeople(from model: [PersonModel]) -> [Person] {
        return model.map {
            return mapPerson(from: $0)
        }
    }
    
    static func mapPerson(from model: PersonModel) -> Person {
        var shows: [Show] = []
        if let showModels = model._embedded?.show {
            shows = showModels.map { model in
                Show(
                    id: model.id,
                    name: model.name,
                    posterUrl: model.image?.medium,
                    summary: model.summary,
                    isFavorite: false,
                    rating: model.rating.average,
                    episodes: [],
                    premiered: nil,
                    genres: model.genres,
                    schedule: nil
                )
            }
        }
        
        var country: Country?
        if let countryModel = model.country {
            country = .init(name: countryModel.name, code: countryModel.code)
        }
        
        return .init(
            id: model.id,
            name: model.name,
            infoUrl: model.url,
            country: country,
            imageUrl: model.image?.medium,
            imageOriginalUrl: model.image?.original,
            birthDate: model.birthday?.toDate(format: "YYYY-MM-dd"),
            gender: model.gender,
            shows: shows)
    }

}
