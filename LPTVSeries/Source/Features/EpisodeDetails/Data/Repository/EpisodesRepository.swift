//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
class EpisodesRepository: EpisodesRepositoryProtocol {
    private let remote: EpisodesRemoteDataSourceProtocol

    init(remote: EpisodesRemoteDataSourceProtocol = EpisodeRemoteDataSource()) {
        self.remote = remote
    }
    
    func fetchEpisodeDetails(id: Int) async throws -> Episode {
        let episodeModel = try await remote.requestEpisodeDetails(id: id)
        return EpisodeMapper.mapEpisode(from: episodeModel)
    }

}
