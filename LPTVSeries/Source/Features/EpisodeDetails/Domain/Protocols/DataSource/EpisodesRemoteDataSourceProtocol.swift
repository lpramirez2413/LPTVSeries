//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
protocol EpisodesRemoteDataSourceProtocol {
    func requestEpisodeDetails(id: Int) async throws -> EpisodeModel
}
