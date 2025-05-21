//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
protocol ShowsRepositoryProtocol {
    func fetchShows(page: Int) async throws -> [Show]
    func searchShows(text: String) async throws -> [Show]
    func setFavorite(_ show: Show) throws
}
