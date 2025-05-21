//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import SwiftUI

struct ShowRow: View {
    
    // MARK: Private properties
    private var show: Show
    private var onFavoriteToggle: (Bool) -> Void
    @State private var isFavorite: Bool
    
    // MARK: Constant properties
    private let imageSize: CGSize = .init(width: 120, height: 160)
    
    init(show: Show, onFavoriteToggle: @escaping (Bool) -> Void) {
        self.show = show
        self.onFavoriteToggle = onFavoriteToggle
        self._isFavorite = State(initialValue: show.isFavorite)
    }
    
    var body: some View {
        HStack(spacing: Spacing.s) {
            posterView
            showInformationView
            Spacer()
            favoriteView
        }
        .frame(height: imageSize.height)
    }
    
    // MARK: Poster
    var posterView: some View {
        AsyncImageView(
            url: show.posterUrl ?? "",
            placeholder: .phShow
        )
        .scaledToFill()
        .frame(width: imageSize.width, height: imageSize.height)
        .clipped()
        .cornerRadius(8)
    }
        
    func successPhaseView(_ image: Image) -> some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: imageSize.width, height: imageSize.height)
            .clipped()
            .cornerRadius(Sizing.s)
    }
    
    // MARK: Show Information

    var showInformationView: some View {
        VStack(alignment: .leading, spacing: Spacing.s) {
            Text(show.name)
                .font(.subheadline)
                .bold()
                .lineLimit(3)
            if let summary = show.summary {
                Text(summary)
                    .font(.caption)
                    .lineLimit(5)
            }
            Spacer()
        }
    }
    
    // MARK: Favorite
    
    var favoriteView: some View {
        VStack {
            Button {
                isFavorite.toggle()
                onFavoriteToggle(isFavorite)
            } label: {
                Image(systemName: isFavorite ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    .padding(.leading, Spacing.s)
                    .padding(.bottom, Spacing.s)
            }
            .buttonStyle(PlainButtonStyle())
            Spacer()
        }
    }
    
}

#Preview {
    ShowRow(
        show: .init(
            id: 1,
            name: "Episode 1",
            posterUrl: "https://static.tvmaze.com/uploads/images/medium_portrait/359/898306.jpg",
            summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
            isFavorite: false,
            rating: 2.0),
        onFavoriteToggle: { _ in }
    )
    .frame(height: 160)
}

