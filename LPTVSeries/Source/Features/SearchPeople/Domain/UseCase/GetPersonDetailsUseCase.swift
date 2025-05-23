//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import Foundation

class GetPersonDetailsUseCase: GetPersonDetailsUseCaseProtocol {

    private let repository: PeopleRepositoryProtocol
    
    init(repository: PeopleRepositoryProtocol =  PeopleRepository()) {
        self.repository = repository
    }
    
    func execute(personId: Int) async throws -> [Show] {
        do {
            return try await repository.fetchPersonDetails(id: personId)
        } catch {
            throw error.asAppError
        }
    }
 
}
