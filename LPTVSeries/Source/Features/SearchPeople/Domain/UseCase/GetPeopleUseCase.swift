//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import Foundation

class GetPeopleUseCase: GetPeopleUseCaseProtocol {

    private let repository: PeopleRepositoryProtocol
    
    init(repository: PeopleRepositoryProtocol =  PeopleRepository()) {
        self.repository = repository
    }
    
    func execute(page: Int) async throws -> [Person] {
        do {
            return try await repository.fetchPeople(page: page)
        } catch {
            throw error.asAppError
        }
    }
 
}
