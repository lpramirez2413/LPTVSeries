//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
protocol SearchPeopleUseCaseProtocol {
    func execute(text: String) async throws -> [Person]
}
