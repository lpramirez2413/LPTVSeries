//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import Foundation

struct GetRecentEpisodesUseCase: GetRecentEpisodesUseCaseProtocol {

    private let repository: RecentEpisodesRepositoryProtocol
    
    init(repository: RecentEpisodesRepositoryProtocol = RecentEpisodesRepository()) {
        self.repository = repository
    }
    
    func execute(by country: String) async throws -> [Episode] {
        do {
            return try await repository.fetchRecentEpisodes(for: country)
        } catch {
            throw error.asAppError
        }
    }
 
}
