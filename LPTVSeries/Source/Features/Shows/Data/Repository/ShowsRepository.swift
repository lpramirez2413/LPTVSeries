//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
class ShowsRepository: ShowsRepositoryProtocol {

    private let remote: ShowsRemoteDataSourceProtocol
    private let local: ShowsLocalDataSourceProtocol

    init(
        remote: ShowsRemoteDataSourceProtocol,
        local: ShowsLocalDataSourceProtocol
    ) {
        self.remote = remote
        self.local = local
    }
    
    convenience init(persistenceController: PersistenceController = .shared) {
        let context = persistenceController.container.newBackgroundContext()
        self.init(
            remote: ShowsRemoteDataSource(),
            local: ShowsLocalDataSource(context: context)
        )
    }
    
    func fetchShows(page: Int) async throws -> [Show] {
        let showModels = try await remote.requestShowsData(page: page)
        return try mapShows(showModels)
    }
    
    func searchShows(text: String) async throws -> [Show] {
        let searchShowModels = try await remote.requestShowsDataBySearch(text: text)
        let showModels = searchShowModels.map { $0.show }
        return try mapShows(showModels)
    }
    
    func fetchShowDetails(id: Int) async throws -> Show {
        let showModel = try await remote.requestShowDetails(id: id)
        let favorites = try local.getFavorites()
        let favoriteIDs = Set(favorites.map { Int($0.id) })
        return ShowMapper.mapShow(from: showModel, favoriteIDs: favoriteIDs)
    }
    
    func setFavorite(_ show: Show) throws {
        if show.isFavorite {
            try local.addFavorite(show: .init(from: show))
        } else {
            try local.removeFavorite(showId: show.id)
        }
    }
    
    // MARK: Private helpers
    private func mapShows(_ showModels: [ShowModel]) throws -> [Show] {
        let favorites = try local.getFavorites()
        let favoriteIDs = Set(favorites.map { Int($0.id) })
        return ShowMapper.mapShows(from: showModels, favoriteIDs: favoriteIDs)
    }
    
}
