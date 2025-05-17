//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
protocol RecentEpisodesRepositoryProtocol {
    func fetchRecentEpisodes(for country: String) async throws -> [Episode]
//    func getAllFavorites() throws -> [Episode]
//    func getFavoriteIDs() throws -> [Int]
//    func saveFavorite(_ episode: Episode) throws
//    func removeFavorite(by id: Int) throws
}
