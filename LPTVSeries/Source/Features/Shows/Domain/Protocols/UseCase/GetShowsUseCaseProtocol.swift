//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
protocol GetShowsUseCaseProtocol {
    func execute(page: Int) async throws -> [Show]
}
