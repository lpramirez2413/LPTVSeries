//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    

import SwiftUI

struct ShowDetailsView: View {
    
    // MARK: Private properties
    @StateObject private var viewModel: ShowDetailsViewModel
    let summaryLineLimit: Int = 10
    
    // MARK: Constant properties
    private let imageSize: CGSize = .init(width: 140, height: 200)
    
    init(show: Show) {
        _viewModel = StateObject(wrappedValue: ShowDetailsViewModel(show: show))
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: Spacing.l) {
                headerView
                    .padding(.horizontal, Spacing.m)
                    .padding(.top, Spacing.m)
                mediaContentView
            }
            .onAppear(perform: viewModel.getShowDetails)
            
        }
        .navigationTitle(viewModel.show.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var headerView: some View {
        VStack(alignment: .leading, spacing: Spacing.m) {
            HStack(alignment: .top, spacing: Spacing.m) {
                posterView
                VStack {
                    if let summary = viewModel.show.summary {
                        Text(summary)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(summaryLineLimit)
                    }
                    if let premieredDate = viewModel.show.premiered {
                        HStack {
                            Text("\(premieredDate.toString(format: "yyyy"))")
                                .font(.body)
                                .foregroundStyle(.white)
                                .padding(.horizontal, Spacing.m/2)
                                .padding(.vertical, Spacing.s/2)
                                .background(Color.red.opacity(0.8))
                                .clipShape(Capsule())
                                .padding(.bottom, Spacing.s)
                            Spacer()
                        }
                    }
                }
            }
            metaDataView
        }
        
    }
    
    var posterView: some View {
        VStack {
            AsyncImageView(
                url: viewModel.show.posterUrl ?? "",
                placeholder: .phShow
            )
            .scaledToFill()
            .frame(width: imageSize.width, height: imageSize.height)
            .clipped()
            .cornerRadius(Sizing.s)
        }
    }
    
    @ViewBuilder
    var mediaContentView: some View {
        VStack(alignment: .leading) {
            Text("Watch")
                .font(.title)
                .padding(.horizontal, Spacing.m)
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
    
    var metaDataView: some View {
        VStack(alignment: .leading, spacing: Spacing.m) {
            HStack(spacing: Spacing.s) {
                ForEach(viewModel.show.genres, id: \.self) { genre in
                    Text(genre)
                        .font(.footnote)
                        .foregroundStyle(.white)
                        .padding(.horizontal, Spacing.m/2)
                        .padding(.vertical, Spacing.s/2)
                        .background(Color.gray.opacity(0.8))
                        .cornerRadius(Sizing.s)
                }
            }
            if let schedule = viewModel.show.schedule {
                Text(schedule)
            }
        }
    }
    
    var seasonsView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .center, spacing: Spacing.s) {
                ForEach(viewModel.seasons, id: \.number) { season in
                    Button {
                        viewModel.selectedSeason = season
                    } label: {
                        Text("Season \(season.number)")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(.horizontal, Spacing.m)
                            .padding(.vertical, Spacing.s)
                            .background(Color.red.opacity(0.8))
                            .clipShape(Capsule())
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal, Spacing.m)
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
                .padding(.horizontal, Spacing.m)
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
            rating: 5.6,
            premiered: Date(),
            genres: ["Action", "Comedy"],
            schedule: "Monday, Tuesday at 08:00 pm"
        )
    )
}
