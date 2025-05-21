//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    

import SwiftUI

struct EpisodeDetailsView: View {
    
    // MARK: Private properties
    @StateObject private var viewModel: EpisodeDetailsViewModel
    
    // MARK: Constant properties    
    init(episode: Episode) {
        _viewModel = StateObject(wrappedValue: EpisodeDetailsViewModel(episode: episode))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                headerView
                VStack {
                    Text(viewModel.episode.name)
                        .font(.largeTitle)
                    episodeInformationView
                }
                .padding(.horizontal, Spacing.m)
                Spacer()
            }
        }
        .navigationTitle("Episode \(viewModel.episode.number)")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var headerView: some View {
        AsyncImageView(
            url: viewModel.episode.posterUrl ?? "",
            placeholder: .phNewEpisode
        )
        .scaledToFill()
        .frame(height: Sizing.scale(24))
        .clipped()
        .frame(maxWidth: .infinity)
    }
    
    var episodeInformationView: some View {
        VStack(alignment: .leading, spacing: Spacing.s) {
            Text(viewModel.episode.name)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
        }
    }
    
}

#Preview {
    EpisodeDetailsView(
        episode: .init(
            id: 1, name: "Episode 1",
            posterUrl: "https://static.tvmaze.com/uploads/images/medium_portrait/359/898306.jpg",
            isFavorite: nil,
            number: 1,
            season: 1))
}
