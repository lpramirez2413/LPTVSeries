//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
protocol ShowsLocalDataSourceProtocol {
    func getFavorites() throws -> [FavoriteShowEntity]
    func addFavorite(show: FavoriteShowDTO) throws
    func removeFavorite(showId: Int) throws
}
