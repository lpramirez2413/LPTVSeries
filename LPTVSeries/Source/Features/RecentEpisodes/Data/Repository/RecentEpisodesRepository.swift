//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
class RecentEpisodesRepository: RecentEpisodesRepositoryProtocol {
    
    private let remote: RecentEpisodesRemoteDataSourceProtocol
    private let local: RecentEpisodesLocalDataSourceProtocol

    init(
        remote: RecentEpisodesRemoteDataSourceProtocol,
        local: RecentEpisodesLocalDataSourceProtocol
    ) {
        self.remote = remote
        self.local = local
    }
    
    convenience init(persistenceController: PersistenceController = .shared) {
        let context = persistenceController.container.newBackgroundContext()
        self.init(
            remote: RecentEpisodesRemoteDataSource(),
            local: RecentEpisodesLocalDataSource(context: context)
        )
    }
    
    func fetchRecentEpisodes(for country: String) async throws -> [Episode] {
        let episodeModels = try await remote.requestRecentEpisodesData(by: country)
        let favoriteIds = try local.getFavoriteIds()
        return EpisodeMapper.mapMovies(from: episodeModels, favoriteIDs: Set(favoriteIds))
    }
    
}
