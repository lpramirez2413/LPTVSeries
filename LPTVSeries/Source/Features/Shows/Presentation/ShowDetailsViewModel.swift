//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import Foundation

class ShowDetailsViewModel: ObservableObject {
    
    // MARK: Private properties
    private let getShowDetailsUseCase: GetShowDetailsUseCaseProtocol
    
    // MARK: Public properties
    @Published var viewState: ViewState = .loading
    @Published var show: Show
    @Published var seasons: [Season] = []
    @Published var selectedSeason: Season?
    
    init(
        getShowDetailsUseCase: GetShowDetailsUseCaseProtocol = GetShowDetailsUseCase(),
        show: Show
    ) {
        self.getShowDetailsUseCase = getShowDetailsUseCase
        self.show = show
    }
    
    enum ViewState: Equatable {
        case loaded
        case loading
        case error(AppError)
    }
    
    @MainActor
    func getShowDetails() {
        Task {
            do {
                show = try await getShowDetailsUseCase.execute(showId: show.id)
                mapSeasons()
                viewState = .loaded
            } catch {
                viewState = .error(.unknown)
            }
        }
    }
    
    // MARK: Private helpers
    
    private func mapSeasons() {
        let episodesBySeason = Dictionary(grouping: show.episodes) { $0.season }
        
        let mappedSeasons = episodesBySeason.map { seasonNumber, episodes in
            let sortedEpisodes = episodes.sorted(by: { $0.number < $1.number })
            return Season(number: seasonNumber, episodes: sortedEpisodes)
        }

        seasons = mappedSeasons.sorted(by: { $0.number < $1.number })
        selectedSeason = seasons.first
    }
    
}

struct Season {
    let number: Int
    let episodes: [Episode]
}
