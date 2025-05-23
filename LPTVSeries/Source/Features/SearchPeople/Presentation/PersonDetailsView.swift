//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    

import SwiftUI

struct PersonDetailsView: View {
    
    // MARK: Private properties
    @StateObject private var viewModel: PersonDetailsViewModel
    
    // MARK: Constant properties
    private let imageSize: CGSize = .init(width: Sizing.scale(22), height: Sizing.scale(30))
    
    init(person: Person) {
        _viewModel = StateObject(wrappedValue: PersonDetailsViewModel(person: person))
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: Spacing.l) {
                headerView
                    .padding(.horizontal, Spacing.m)
                    .padding(.top, Spacing.m)
                showsView
            }
            .onAppear(perform: viewModel.getPersonDetails)
            
        }
        .navigationTitle(viewModel.person.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var headerView: some View {
        VStack(alignment: .leading, spacing: Spacing.m) {
            HStack(alignment: .top, spacing: Spacing.m) {
                posterView
                VStack(alignment: .leading, spacing: Spacing.m) {
                    Group {
                        if let country = viewModel.person.country {
                            Text("\(country.code.flagEmoji ?? "") \(country.name)")
                        }
                        if let birthDate = viewModel.person.birthDate {
                            Text("🎂 \(birthDate.toString(format: "MMM dd, yyyy"))")
                              
                        }
                        if let gender = viewModel.person.gender {
                            Text(gender)
                        }
                    }
                    .font(.body)
                    .foregroundStyle(.white)
                    .padding(.horizontal, Spacing.m/2)
                    .padding(.vertical, Spacing.s/2)
                    .background(Color.red.opacity(0.8))
                    .clipShape(Capsule())
                    .padding(.bottom, Spacing.s)
                    
                }
            }
        }
        
    }
    
    var posterView: some View {
        VStack {
            AsyncImageView(
                url: viewModel.person.imageOriginalUrl ?? "",
                placeholder: .phShow
            )
            .scaledToFill()
            .frame(width: imageSize.width, height: imageSize.height)
            .clipped()
            .cornerRadius(Sizing.s)
        }
    }
    
    @ViewBuilder
    var showsView: some View {
        VStack(alignment: .leading) {
            Text("Shows")
                .font(.title)
                .padding(.horizontal, Spacing.m)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: Spacing.s) {
                    ForEach(viewModel.person.shows, id: \.id) { show in
                        NavigationLink(value: show) {
                            ShowRow(show: show, onFavoriteToggle: nil)
                                .frame(width: imageSize.width)
                        }
                    }
                }
                .padding(.horizontal, Spacing.m)
            }
        }
        .navigationDestination(for: Show.self) { show in
            ShowDetailsView(show: show)
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
            rating: 5.6,
            premiered: Date(),
            genres: ["Action", "Comedy"],
            schedule: "Monday, Tuesday at 08:00 pm"
        )
    )
}
