//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
class GetEpisodeDetailsUseCase: GetEpisodeDetailsUseCaseProtocol {
    
    private let repository: EpisodesRepositoryProtocol
    
    init(repository: EpisodesRepositoryProtocol =  EpisodesRepository()) {
        self.repository = repository
    }

    func execute(episodeId: Int) async throws -> Episode {
        do {
            return try await repository.fetchEpisodeDetails(id: episodeId)
        } catch {
            throw error.asAppError
        }
    }

}
