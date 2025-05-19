//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    

import Foundation

class RecentEpisodesViewModel: ObservableObject {
    
    // MARK: Private properties
    private let getRecentEpisodesUseCase: GetRecentEpisodesUseCaseProtocol
    
    // MARK: Public properties
    @Published var episodes: [Episode] = []
    @Published var countryCode: String = "US"
    @Published var viewState: ViewState = .loading
    

    init(getRecentEpisodesUseCase: GetRecentEpisodesUseCaseProtocol = GetRecentEpisodesUseCase()) {
        self.getRecentEpisodesUseCase = getRecentEpisodesUseCase
    }
    
    enum ViewState: Equatable {
        case loaded
        case loading
        case error(AppError)
    }
    
    @MainActor
    func getEpisodes() {
        viewState = .loading
        Task {
            do {
                episodes = try await getRecentEpisodesUseCase.execute(by: countryCode)
                viewState = .loaded
            } catch {
                viewState = .error(.unknown)
            }
        }
    }
    
}
