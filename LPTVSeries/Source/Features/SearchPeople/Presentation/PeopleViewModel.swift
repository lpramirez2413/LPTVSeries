//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
  
import Combine
import Foundation

class PeopleViewModel: ObservableObject {
    
    // MARK: Private properties
    private let getPeopleUseCase: GetPeopleUseCaseProtocol
    private let searchPeopleUseCase: SearchPeopleUseCaseProtocol
    private var page: Int = 0
    private var cancellables = Set<AnyCancellable>()
    private var backupPeople: [Person] = []
    
    // MARK: Public properties
    @Published var viewState: ViewState = .loading
    @Published var people: [Person] = []
    @Published var searchText: String = ""
    
    init(getPeopleUseCase: GetPeopleUseCaseProtocol = GetPeopleUseCase(),
         searchPeopleUseCase: SearchPeopleUseCaseProtocol = SearchPeopleUseCase()
        ) {
        self.getPeopleUseCase = getPeopleUseCase
        self.searchPeopleUseCase = searchPeopleUseCase
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
                    await self?.searchPeople(with: text)
                }
            }
            .store(in: &cancellables)
    }
    
    @MainActor
    func getPeople() {
        if people.isEmpty {
            viewState = .loading
        }
        
        Task {
            do {
                let fetchedPeople = try await getPeopleUseCase.execute(page: page)
                if !fetchedPeople.isEmpty {
                    page += 1
                    people.append(contentsOf: fetchedPeople)
                    backupPeople = people
                }
                viewState = .loaded
            } catch {
                viewState = .error(.unknown)
            }
        }
    }
    
    @MainActor
    func searchPeople(with text: String) async {
        guard !text.isEmpty else {
            people = backupPeople
            return
        }
        
        viewState = .loading
        do {
            let fetchedPeople = try await searchPeopleUseCase.execute(text: text)
            people = fetchedPeople
            viewState = .loaded
        } catch {
            viewState = .error(.unknown)
        }
        
    }
    
}
