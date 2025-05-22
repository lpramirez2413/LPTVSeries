//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    
    // MARK: Private properties
    private let getFavoriteShowsUseCase: GetFavoriteShowsUseCaseProtocol
    private let removeFavoriteShowUseCase: RemoveFavoriteShowUseCaseProtocol
    
    // MARK: Public properties
    @Published var viewState: ViewState = .empty
    @Published var favoriteShows: [Favorite] = []
    
    init(
        getFavoriteShowsUseCase: GetFavoriteShowsUseCaseProtocol = GetFavoriteShowsUseCase(),
        removeFavoriteShowUseCase: RemoveFavoriteShowUseCaseProtocol = RemoveFavoriteShowUseCase()
        ) {
        self.getFavoriteShowsUseCase = getFavoriteShowsUseCase
        self.removeFavoriteShowUseCase = removeFavoriteShowUseCase
    }
    
    enum ViewState: Equatable {
        case empty
        case loaded
        case error(AppError)
    }
    
    @MainActor
    func getFavoriteShows() {
        do {
            favoriteShows = try getFavoriteShowsUseCase.execute()
            viewState = .loaded
        } catch {
            viewState = .error(.unknown)
        }
    }
    
    @MainActor
    func removeFavoriteShow(at offsets: IndexSet) {
        guard let index = offsets.first else {
            return
        }
        
        let favorite = favoriteShows[index]
        
        do {
            try removeFavoriteShowUseCase.execute(showId: favorite.id)
            favoriteShows.remove(at: index)
            viewState = .loaded
        } catch {
            viewState = .error(.unknown)
        }
    }
    
    func mapFavoriteToShow(_ favoriteShow: Favorite) -> Show {
        .init(
            id: favoriteShow.id,
            name: favoriteShow.name ?? "",
            posterUrl: favoriteShow.posterUrl,
            summary: favoriteShow.summary,
            isFavorite: true,
            rating: favoriteShow.rating
        )
    }
    
}
