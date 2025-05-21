//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    

import SwiftUI

struct ShowDetailsView: View {
    
    // MARK: Private properties
    @StateObject private var viewModel: ShowDetailsViewModel
    
    // MARK: Constant properties
    private let imageSize: CGSize = .init(width: 140, height: 200)
    
    init(show: Show) {
        _viewModel = StateObject(wrappedValue: ShowDetailsViewModel(show: show))
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: Spacing.l) {
                headerView
                    .padding(.top, Spacing.m)
                mediaContentView
            }
            .onAppear(perform: viewModel.getShowDetails)
            
        }
        .padding(.horizontal, Spacing.m)
        .navigationTitle(viewModel.show.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var headerView: some View {
        HStack(alignment: .top, spacing: Spacing.m) {
            posterView
            VStack(alignment: .leading, spacing: Spacing.s) {
                if let summary = viewModel.show.summary {
                    Text(summary)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
    
    var posterView: some View {
        AsyncImageView(
            url: viewModel.show.posterUrl ?? "",
            placeholder: .phShow
        )
        .scaledToFill()
        .frame(width: imageSize.width, height: imageSize.height)
        .clipped()
        .cornerRadius(Sizing.s)
    }
    
    @ViewBuilder
    var mediaContentView: some View {
        VStack(alignment: .leading) {
            Text("Watch")
                .font(.title)
            Group {
                switch viewModel.viewState {
                case .loaded:
                    VStack(spacing: Spacing.l) {
                        seasonsView
                        episodes
                    }
                case .loading:
                    VStack {
                        Text("Loading media content")
                        ProgressView()
                    }
                    
                case .error(let appError):
                    Text("Error occured")
                }
            }
        }
    }
    
    var seasonsView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .center, spacing: Spacing.m) {
                ForEach(viewModel.seasons, id: \.number) { season in
                    Button {
                        print("SELECT SEASON \(season.number)")
                        viewModel.selectedSeason = season
                    } label: {
                        Text("Season \(season.number)")
                            .font(.headline)
                            .padding(.horizontal, Spacing.m)
                            .padding(.vertical, Spacing.s)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Capsule())
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
    
    @ViewBuilder
    var episodes: some View {
        if let selectedSeason = viewModel.selectedSeason {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: Spacing.s) {
                    ForEach(selectedSeason.episodes, id: \.id) { episode in
                        NavigationLink {
                            EpisodeDetailsView(episode: episode)
                        } label: {
                            ShowEpisodeView(episode: episode)
                        }
                    }
                }
            }
        }
    }
    
}

#Preview {
    ShowDetailsView(
        show: .init(
            id: 1,
            name: "Show 1",
            posterUrl: "https://static.tvmaze.com/uploads/images/medium_portrait/359/898306.jpg",
            summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
            isFavorite: false,
            rating: 5.6))
}
