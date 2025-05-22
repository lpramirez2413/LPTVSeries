//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import SwiftUI

struct FavoritesView: View {
    
    @StateObject var viewModel: FavoritesViewModel = .init()
    
    var body: some View {
        ZStack {
            switch viewModel.viewState {
            case .loaded:
                content
            case .empty:
                Text("Marked favorites will appear here.")
            case .error(let appError):
                errorView(appError)
            }
        }
        .onAppear(perform: viewModel.getFavoriteShows)
        .navigationTitle("Favorite Shows")
    }
    
    var content: some View {
        List {
            ForEach(viewModel.favoriteShows, id: \.id) { favoriteShow in
                NavigationLink(value: favoriteShow) {
                    FavoriteRow(
                        favorite: favoriteShow) {
                            print("On favorite removed")
                        }
                }
            }
            .onDelete(perform: viewModel.removeFavoriteShow)
        }
        .navigationDestination(for: Favorite.self) { favoriteShow in
            ShowDetailsView(show: viewModel.mapFavoriteToShow(favoriteShow))
        }
    }
    
    func errorView(_ error: AppError) -> some View {
        ErrorView(title: error.message)
    }

}

#Preview {
    ShowsView()
}

