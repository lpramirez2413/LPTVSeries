//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import SwiftUI

struct ShowsView: View {
    
    // MARK: Private properties
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @StateObject var viewModel: ShowsViewModel = .init()
    @State private var isSearchPresented = false
    
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
        .onAppear(perform: viewModel.getShows)
        .searchable(
            text: $viewModel.searchText,
            isPresented: $isSearchPresented
        )
        .navigationTitle("Shows")
    }
    
    var content: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.shows, id: \.id) { show in
                    NavigationLink(value: show) {
                        ShowRow(
                            show: show,
                            onFavoriteToggle: { isFavorite in
                                var updatedShow = show
                                updatedShow.isFavorite = isFavorite
                                viewModel.setFavorite(updatedShow)
                            }
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                if viewModel.viewState == .loaded && !isSearchPresented {
                    HStack {
                        Spacer()
                        ProgressView("Loading...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .foregroundColor(.gray)
                            .foregroundColor(.red)
                            .onAppear(perform: viewModel.getShows)
                        Spacer()
                    }
                }
            }
            .padding()
        }
        .navigationDestination(for: Show.self) { show in
            ShowDetailsView(show: show)
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
    ShowsView()
}
