//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

class RemoveFavoriteShowUseCase: RemoveFavoriteShowUseCaseProtocol {
    
    private let repository: FavoritesRepositoryProtocol
    
    init(repository: FavoritesRepositoryProtocol =  FavoritesRepository()) {
        self.repository = repository
    }
    
    func execute(showId: Int) throws {
        do {
            return try repository.removeFavoriteShow(showId: showId)
        } catch {
            throw error.asAppError
        }
    }
    
}
