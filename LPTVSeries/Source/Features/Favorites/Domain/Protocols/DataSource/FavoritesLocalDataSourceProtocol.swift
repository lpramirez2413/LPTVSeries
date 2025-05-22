//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

protocol FavoritesLocalDataSourceProtocol {
    func getFavoriteShows() throws -> [FavoriteShowEntity]
    func removeFavoriteShow(showId: Int) throws
}
