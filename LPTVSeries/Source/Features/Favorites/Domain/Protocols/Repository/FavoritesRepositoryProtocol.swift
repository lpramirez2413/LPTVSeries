//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

protocol FavoritesRepositoryProtocol {
    func fetchFavoriteShows() throws -> [Favorite]
    func removeFavoriteShow(showId: Int) throws
}
