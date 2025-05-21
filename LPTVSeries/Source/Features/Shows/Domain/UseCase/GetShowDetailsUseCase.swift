//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
class GetShowDetailsUseCase: GetShowDetailsUseCaseProtocol {
    
    private let repository: ShowsRepositoryProtocol
    
    init(repository: ShowsRepositoryProtocol =  ShowsRepository()) {
        self.repository = repository
    }

    func execute(showId: Int) async throws -> Show {
        do {
            return try await repository.fetchShowDetails(id: showId)
        } catch {
            throw error.asAppError
        }
    }

}
