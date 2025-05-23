//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import SwiftUI

struct PeopleView: View {
    
    // MARK: Private properties
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @StateObject var viewModel: PeopleViewModel = .init()
    @State private var isSearchPresented = false
    
    var body: some View {
        ZStack {
            switch viewModel.viewState {
            case .loaded:
                content
            case .loading:
                loadingView
            case .error(let appError):
                errorView(appError)
            }
        }
        .onAppear(perform: viewModel.getPeople)
        .searchable(
            text: $viewModel.searchText,
            isPresented: $isSearchPresented
        )
        .navigationTitle("People")
    }
    
    var content: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.people, id: \.hashValue) { person in
                    NavigationLink(value: person) {
                        PersonRow(person: person)
                    }
                }
                if viewModel.viewState == .loaded && !isSearchPresented {
                    HStack {
                        Spacer()
                        ProgressView("Loading...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .foregroundColor(.gray)
                            .foregroundColor(.red)
                            .onAppear(perform: viewModel.getPeople)
                        Spacer()
                    }
                }
            }
            .padding()
        }
        .navigationDestination(for: Person.self) { person in
            PersonDetailsView(person: person)
        }
    }
    
    var loadingView: some View {
        LoadingView()
    }
    
    func errorView(_ error: AppError) -> some View {
        ErrorView(title: error.message)
    }

}

#Preview {
    PeopleView()
}
