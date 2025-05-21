//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    

import Foundation

class SetFavoriteShowUseCase: SetFavoriteShowUseCaseProtocol {
    
    private let repository: ShowsRepositoryProtocol
    
    init(repository: ShowsRepositoryProtocol =  ShowsRepository()) {
        self.repository = repository
    }
    
    func execute(show: Show) throws {
        do {
            return try repository.setFavorite(show)
        } catch {
            throw error.asAppError
        }
    }
 
}
