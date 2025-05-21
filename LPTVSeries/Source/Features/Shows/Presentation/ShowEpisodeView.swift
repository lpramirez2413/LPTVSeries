//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    

import SwiftUI

struct ShowEpisodeView: View {

    // MARK: Public properties
    @State var episode: Episode
    
    init (episode: Episode) {
        self.episode = episode
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Episode \(episode.number)")
                .font(.subheadline)
                .foregroundStyle(.gray)
            thumbnailView
        }
    }
    
    var thumbnailView: some View {
        AsyncImageView(
            url: episode.posterUrl ?? "",
            placeholder: .phNewEpisode
        )
        .scaledToFill()
        .frame(height: Sizing.scale(14))
        .clipped()
        .cornerRadius(Sizing.s)
    }
    
}

#Preview {
    ShowEpisodeView(
        episode: .init(
            id: 1,
            name: "Episode 1",
            posterUrl: "https://static.tvmaze.com/uploads/images/medium_portrait/359/898306.jpg",
            isFavorite: nil,
            number: 1,
            season: 1)
    )
}
