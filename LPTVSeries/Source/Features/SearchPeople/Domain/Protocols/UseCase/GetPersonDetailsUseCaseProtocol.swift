//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
protocol GetPersonDetailsUseCaseProtocol {
    func execute(personId: Int) async throws -> [Show]
}
