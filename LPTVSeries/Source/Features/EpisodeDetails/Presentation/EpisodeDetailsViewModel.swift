//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import Foundation

class EpisodeDetailsViewModel: ObservableObject {
    
    // MARK: Private properties
    private let getEpisodeDetailsUseCase: GetEpisodeDetailsUseCaseProtocol
    
    // MARK: Public properties
    @Published var viewState: ViewState = .loading
    @Published var episode: Episode
    
    init(
        getEpisodeDetailsUseCase: GetEpisodeDetailsUseCaseProtocol = GetEpisodeDetailsUseCase(),
        episode: Episode
    ) {
        self.getEpisodeDetailsUseCase = getEpisodeDetailsUseCase
        self.episode = episode
    }
    
    enum ViewState: Equatable {
        case loaded
        case loading
        case error(AppError)
    }
    
    @MainActor
    func getEpisodeDetails() {
        Task {
            do {
                episode = try await getEpisodeDetailsUseCase.execute(episodeId: episode.id)
                viewState = .loaded
            } catch {
                viewState = .error(.unknown)
            }
        }
    }

}
