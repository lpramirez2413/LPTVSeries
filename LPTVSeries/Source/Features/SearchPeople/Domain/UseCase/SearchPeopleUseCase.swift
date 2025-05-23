//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
class SearchPeopleUseCase: SearchPeopleUseCaseProtocol {
    
    private let repository: PeopleRepositoryProtocol
    
    init(repository: PeopleRepositoryProtocol =  PeopleRepository()) {
        self.repository = repository
    }

    func execute(text: String) async throws -> [Person] {
        do {
            return try await repository.searchPeople(text: text)
        } catch {
            throw error.asAppError
        }
    }

}
