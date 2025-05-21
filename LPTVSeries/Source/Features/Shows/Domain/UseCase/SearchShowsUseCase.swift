//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
class SearchShowsUseCase: SearchShowsUseCaseProtocol {
    
    private let repository: ShowsRepositoryProtocol
    
    init(repository: ShowsRepositoryProtocol =  ShowsRepository()) {
        self.repository = repository
    }

    func execute(text: String) async throws -> [Show] {
        do {
            return try await repository.searchShows(text: text)
        } catch {
            throw error.asAppError
        }
    }

}
