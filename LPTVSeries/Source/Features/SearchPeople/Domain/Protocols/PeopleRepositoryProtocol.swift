//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
protocol PeopleRepositoryProtocol {
    func fetchPeople(page: Int) async throws -> [Person]
    func searchPeople(text: String) async throws -> [Person]
    func fetchPersonDetails(id: Int) async throws -> [Show]
}
