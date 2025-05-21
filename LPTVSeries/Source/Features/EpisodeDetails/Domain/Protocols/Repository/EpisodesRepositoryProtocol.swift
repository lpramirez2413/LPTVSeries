//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
protocol EpisodesRepositoryProtocol {
    func fetchEpisodeDetails(id: Int) async throws -> Episode
}
