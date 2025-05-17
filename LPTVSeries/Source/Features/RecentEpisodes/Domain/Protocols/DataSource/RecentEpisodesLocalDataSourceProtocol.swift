//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
protocol RecentEpisodesLocalDataSourceProtocol {
    func getFavoriteIds() throws -> [Int]
//    func saveFavorite(_ model: EpisodeModel) throws
//    func removeFavorite(by id: Int) throws
}
