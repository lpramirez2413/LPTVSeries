//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
struct RecentEpisodesRepository: RecentEpisodesRepositoryProtocol {
    
    private let remote: RecentEpisodesRemoteDataSourceProtocol
    private let local: RecentEpisodesLocalDataSourceProtocol

    init(
        remote: RecentEpisodesRemoteDataSourceProtocol,
        local: RecentEpisodesLocalDataSourceProtocol
    ) {
        self.remote = remote
        self.local = local
    }
    
    func fetchRecentEpisodes(for country: String) async throws -> [Episode] {
        let episodeModels = try await remote.requestRecentEpisodesData(by: country)
        let favoriteIds = try local.getFavoriteIds()
        return EpisodeMapper.mapMovies(from: episodeModels, favoriteIDs: Set(favoriteIds))
        
    }
    
//    func getAllFavorites() throws -> [Episode] {
//
//    }
//    
//    func getFavoriteIDs() throws -> [Int] {
//
//    }
//    
//    func saveFavorite(_ episode: Episode) throws {
//
//    }
//    
//    func removeFavorite(by id: Int) throws {
//
//    }
    
    
}
