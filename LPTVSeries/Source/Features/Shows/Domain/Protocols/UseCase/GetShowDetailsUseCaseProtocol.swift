//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
protocol GetShowDetailsUseCaseProtocol {
    func execute(showId: Int) async throws -> Show
}
