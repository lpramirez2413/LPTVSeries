//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
protocol GetEpisodeDetailsUseCaseProtocol {
    func execute(episodeId: Int) async throws -> Episode
}
