//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
protocol RecentEpisodesRepositoryProtocol {
    func fetchRecentEpisodes(for country: String) async throws -> [Episode]
}
