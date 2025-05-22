//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

class FavoritesRepository: FavoritesRepositoryProtocol {

    private let local: FavoritesLocalDataSourceProtocol
    
    init(
        local: FavoritesLocalDataSourceProtocol
    ) {
        self.local = local
    }
    
    convenience init(persistenceController: PersistenceController = .shared) {
        let context = persistenceController.container.newBackgroundContext()
        self.init(
            local: FavoritesLocalDataSource(context: context)
        )
    }
    
    func fetchFavoriteShows() throws -> [Favorite] {
        let favorites = try local.getFavoriteShows()
        return FavoriteMapper.mapFavoriteShows(from: favorites)
    }
    
    func removeFavoriteShow(showId: Int) throws {
        try local.removeFavoriteShow(showId: showId)
    }

}
