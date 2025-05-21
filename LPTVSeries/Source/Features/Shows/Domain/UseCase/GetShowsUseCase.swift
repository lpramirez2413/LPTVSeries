//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import Foundation

class GetShowsUseCase: GetShowsUseCaseProtocol {

    private let repository: ShowsRepositoryProtocol
    
    init(repository: ShowsRepositoryProtocol =  ShowsRepository()) {
        self.repository = repository
    }
    
    func execute(page: Int) async throws -> [Show] {
        do {
            return try await repository.fetchShows(page: page)
        } catch {
            throw error.asAppError
        }
    }
 
}
