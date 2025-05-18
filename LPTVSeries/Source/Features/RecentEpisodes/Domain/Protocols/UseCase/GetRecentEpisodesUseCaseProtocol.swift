//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
protocol GetRecentEpisodesUseCaseProtocol {
    func execute(by country: String) async throws -> [Episode]
}
