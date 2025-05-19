//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    

import SwiftUI

struct RecentEpisodesView: View {
    
    @StateObject var viewModel: RecentEpisodesViewModel = .init()
    
    var body: some View {
        ZStack {
            switch viewModel.viewState {
            case .loaded:
                content
            case .loading:
                loadingView
            case .error(let appError):
                errorView(appError)
            }
        }
        .onAppear(perform: viewModel.getEpisodes)
        .navigationTitle("Recent Episodes")
    }
    
    var content: some View {
        List (viewModel.episodes, id:  \.id) { episode in
            RecentEpisodeRow(episode: episode,
                             onFavoriteToggle: { isFavorite in
                print("Marked as favorite")
            })
            .frame(height: 80)
        }
    }
    
    var loadingView: some View {
        LoadingView()
    }
    
    func errorView(_ error: AppError) -> some View {
        ErrorView(title: error.message)
    }
    
}

#Preview {
    RecentEpisodesView()
}
