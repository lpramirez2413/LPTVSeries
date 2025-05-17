//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
protocol RecentEpisodesRemoteDataSourceProtocol {
    func requestRecentEpisodesData(by country: String) async throws -> [EpisodeModel]
}
