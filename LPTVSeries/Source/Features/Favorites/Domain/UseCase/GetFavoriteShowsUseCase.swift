//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

class GetFavoriteShowsUseCase: GetFavoriteShowsUseCaseProtocol {
    
    private let repository: FavoritesRepositoryProtocol
    
    init(repository: FavoritesRepositoryProtocol =  FavoritesRepository()) {
        self.repository = repository
    }

    func execute() throws -> [Favorite] {
        try repository.fetchFavoriteShows()
    }
    
}
