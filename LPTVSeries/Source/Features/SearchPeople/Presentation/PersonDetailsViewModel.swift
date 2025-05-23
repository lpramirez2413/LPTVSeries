//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import Foundation

class PersonDetailsViewModel: ObservableObject {
    
    // MARK: Private properties
    private let getPersonDetailsUseCase: GetPersonDetailsUseCaseProtocol
    
    // MARK: Public properties
    @Published var viewState: ViewState = .loading
    //@Published var shows: [Show] = []
    @Published var person: Person
    
    init(
        getPersonDetailsUseCase: GetPersonDetailsUseCaseProtocol = GetPersonDetailsUseCase(),
        person: Person
    ) {
        self.getPersonDetailsUseCase = getPersonDetailsUseCase
        self.person = person
    }
    
    enum ViewState: Equatable {
        case loaded
        case loading
        case error(AppError)
    }
    
    @MainActor
    func getPersonDetails() {
        Task {
            do {
                person.shows = try await getPersonDetailsUseCase.execute(personId: person.id)
                viewState = .loaded
            } catch {
                viewState = .error(.unknown)
            }
        }
    }
    
}
