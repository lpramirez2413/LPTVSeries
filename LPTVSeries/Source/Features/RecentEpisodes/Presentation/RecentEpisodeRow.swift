//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    

import SwiftUI

struct RecentEpisodeRow: View {
    
    // MARK: Private properties
    private var episode: Episode
    private var onFavoriteToggle: (Bool) -> Void
    
    // MARK: Constant properties
    private let imageSize: CGSize = .init(width: 140, height: 80)
    
    init(episode: Episode, onFavoriteToggle: @escaping (Bool) -> Void) {
        self.episode = episode
        self.onFavoriteToggle = onFavoriteToggle
    }
    
    var body: some View {
        HStack(spacing: Spacing.s) {
            AsyncImage(url: URL(string: episode.posterUrl ?? "")) { phase in
                switch phase {
                case .empty:
                    emptyPhaseView
                case .success(let image):
                    successPhaseView(image)
                default:
                    errorPhaseView
                }
            }
            VStack(alignment: .leading, spacing: Spacing.s) {
                Text(episode.name)
                    .font(.subheadline)
                    .lineLimit(3)
                Spacer()
            }
            Spacer()
            Button {
                onFavoriteToggle(true)
            } label: {
                Image(systemName: episode.isFavorite ? "star.fill" : "star")
                    .foregroundColor(.red)
                    .padding(Spacing.s)
            }
        }
    }
    
        
    func successPhaseView(_ image: Image) -> some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: imageSize.width, height: imageSize.height)
            .clipped()
            .cornerRadius(Sizing.s)
    }
    
    var emptyPhaseView: some View {
        Image(.phNewEpisode)
            .resizable()
            .scaledToFill()
            .frame(width: imageSize.width, height: imageSize.height)
            .clipped()
            .cornerRadius(Sizing.s)
    }
    
    var errorPhaseView: some View {
        Image(.phNewEpisode)
            .resizable()
            .scaledToFill()
            .frame(width: imageSize.width, height: imageSize.height)
            .clipped()
            .cornerRadius(Sizing.s)
    }
    
}

#Preview {
    RecentEpisodeRow(
        episode: .init(
            id: 1,
            name: "Episode 1",
            posterUrl: "https://static.tvmaze.com/uploads/images/medium_portrait/359/898306.jpg",
            isFavorite: false),
        onFavoriteToggle: { _ in }
    )
    .frame(height: 100)
}
