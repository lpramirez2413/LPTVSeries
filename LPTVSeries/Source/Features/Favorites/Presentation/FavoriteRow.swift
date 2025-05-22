//
//  FavoriteRow.swift
//  LPTVSeries
//
//  Created by Luis Perez on 21/05/25.
//

import SwiftUI

struct FavoriteRow: View {
    
    // MARK: Private properties
    private var favorite: Favorite
    private var onRemoveFavorite: () -> Void
    
    // MARK: Constant properties
    private let imageSize: CGSize = .init(
        width: Sizing.scale(12),
        height: Sizing.scale(16)
    )
    
    init(
        favorite: Favorite,
        onRemoveFavorite: @escaping () -> Void) {
        self.favorite = favorite
        self.onRemoveFavorite = onRemoveFavorite
    }
    
    var body: some View {
        HStack(spacing: Spacing.s) {
            posterView
            showInformationView
            Spacer()
        }
        .frame(height: imageSize.height)
    }
    
    // MARK: Poster
    var posterView: some View {
        AsyncImageView(
            url: favorite.posterUrl ?? "",
            placeholder: .phShow
        )
        .scaledToFill()
        .frame(width: imageSize.width, height: imageSize.height)
        .clipped()
        .cornerRadius(8)
    }
    
    // MARK: Show Information

    var showInformationView: some View {
        VStack(alignment: .leading, spacing: Spacing.s) {
            Text(favorite.name ?? "")
                .font(.subheadline)
                .bold()
                .lineLimit(3)
            if let summary = favorite.summary {
                Text(summary)
                    .font(.caption)
                    .lineLimit(5)
            }
            Spacer()
        }
    }
    
}

#Preview {
    FavoriteRow(
        favorite: .init(
            id: 1,
            posterUrl: "https://static.tvmaze.com/uploads/images/medium_portrait/359/898306.jpg",
            name: "Favorite 1",
            rating: 7.8,
            summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"),
        onRemoveFavorite: { }
    )
    .frame(height: 160)
}
