//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
  
import Combine
import Foundation

class ShowsViewModel: ObservableObject {
    
    // MARK: Private properties
    private let getShowsUseCase: GetShowsUseCaseProtocol
    private let setFavoriteShowUseCase: SetFavoriteShowUseCaseProtocol
    private let searchShowsUseCase: SearchShowsUseCaseProtocol
    private var page: Int = 0
    private var cancellables = Set<AnyCancellable>()
    private var backupShows: [Show] = []
    
    // MARK: Public properties
    @Published var viewState: ViewState = .loading
    @Published var shows: [Show] = []
    @Published var searchText: String = ""
    
    init(getShowsUseCase: GetShowsUseCaseProtocol = GetShowsUseCase(),
         setFavoriteShowUseCase: SetFavoriteShowUseCaseProtocol = SetFavoriteShowUseCase(),
         searchShowsUseCase: SearchShowsUseCaseProtocol = SearchShowsUseCase()
        ) {
        self.getShowsUseCase = getShowsUseCase
        self.setFavoriteShowUseCase = setFavoriteShowUseCase
        self.searchShowsUseCase = searchShowsUseCase
        setBindings()
    }
    
    enum ViewState: Equatable {
        case loaded
        case loading
        case error(AppError)
    }
    
    private func setBindings() {
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                Task {
                    await self?.searchShows(with: text)
                }
            }
            .store(in: &cancellables)
    }
    
    @MainActor
    func getShows() {
        if shows.isEmpty {
            viewState = .loading
        }
        
        Task {
            do {
                let fetchedShows = try await getShowsUseCase.execute(page: page)
                if !fetchedShows.isEmpty {
                    page += 1
                    shows.append(contentsOf: fetchedShows)
                    backupShows = shows
                }
                viewState = .loaded
            } catch {
                viewState = .error(.unknown)
            }
        }
    }
    
    @MainActor
    func searchShows(with text: String) async {
        guard !text.isEmpty else {
            shows = backupShows
            return
        }
        
        viewState = .loading
        do {
            let fetchedShows = try await searchShowsUseCase.execute(text: text)
            shows = fetchedShows
            viewState = .loaded
        } catch {
            viewState = .error(.unknown)
        }
        
    }
    
    @MainActor
    func setFavorite(_ show: Show) {
        do {
            try setFavoriteShowUseCase.execute(show: show)
            updateShowFavoriteStatus(show)
        } catch {
            print("An error occured: \(error)")
        }
    }
    
    // MARK: Private helpers
    
    private func updateShowFavoriteStatus(_ show: Show) {
        if let index = shows.firstIndex(where: { $0.id == show.id }) {
            shows[index] = show
        }
    }
    
}
