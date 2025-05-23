//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
protocol GetPeopleUseCaseProtocol {
    func execute(page: Int) async throws -> [Person]
}
