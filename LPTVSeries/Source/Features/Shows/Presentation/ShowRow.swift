//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import SwiftUI

struct ShowRow: View {
    
    // MARK: Private properties
    private var show: Show
    private var onFavoriteToggle: ((Bool) -> Void)?
    @State private var isFavorite: Bool
    
    // MARK: Constant properties
    private let gridMiniumHeight: CGFloat = Sizing.scale(35)
    
    init(show: Show, onFavoriteToggle: ((Bool) -> Void)?) {
        self.show = show
        self.onFavoriteToggle = onFavoriteToggle
        self._isFavorite = State(initialValue: show.isFavorite)
    }
    
    var body: some View {
        ZStack {
            posterView
            backgroundGradient
            showInformationView
            if let onFavoriteToggle {
                favoriteView
            }
        }
        .cornerRadius(8)
        .clipped()
        
    }
    
    // MARK: Poster
    var posterView: some View {
        AsyncImageView(
            url: show.posterUrl ?? "",
            placeholder: .phShow
        )
    }
    
    var backgroundGradient: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.black.opacity(0.1),
                Color.black.opacity(0.7),
                Color.black.opacity(0.9)]),
            startPoint: .center,
            endPoint: .bottom
        )
        .frame(maxWidth: .infinity, alignment: .bottom)
    }
    
    // MARK: Show Information

    var showInformationView: some View {
        VStack {
            Spacer()
            Text(show.name)
                .foregroundStyle(.white)
                .font(.callout)
                .frame(maxWidth: .infinity)
            if let rating = show.rating {
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundStyle(.yellow)
                    Text(String(format: "%.1f", rating))
                        .foregroundStyle(.white)
                        .font(.caption)
                    Spacer()
                }
            }
        }
        .padding(.bottom, Spacing.s)
        .padding(.horizontal, Spacing.s)
    }
    
    // MARK: Favorite
    
    var favoriteView: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    isFavorite.toggle()
                    onFavoriteToggle?(isFavorite)
                } label: {
                    Image(systemName: isFavorite ? "bookmark.circle.fill" : "bookmark.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: Sizing.l, height: Sizing.l)
                        .foregroundColor(isFavorite ? Color.red.opacity(0.8) : Color.white.opacity(0.8))
                        .padding(.leading, Spacing.s)
                        .padding(.bottom, Spacing.s)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.trailing, Spacing.s/2)
                .padding(.top, Spacing.s/2)
            }
            Spacer()
        }
    }
    
}

#Preview {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    let items = Array(1...6)

    return ScrollView {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(items, id: \.self) { item in
                ShowRow(
                    show: .init(
                        id: 1,
                        name: "The morning show",
                        posterUrl: "https://static.tvmaze.com/uploads/images/medium_portrait/359/898306.jpg",
                        summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                        isFavorite: false,
                        rating: 7.3,
                        premiered: Date(),
                        genres: ["Action", "Comedy"],
                        schedule: "Monday, Tuesday at 08:00 pm"),
                    onFavoriteToggle: { _ in }
                )
            }
        }
        .padding()
    }
}

