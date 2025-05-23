//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
class PeopleRepository: PeopleRepositoryProtocol {
    
    private let remote: PeopleRemoteDataSourceProtocol

    init(remote: PeopleRemoteDataSourceProtocol = PeopleRemoteDataSource()) {
        self.remote = remote
    }

    func fetchPeople(page: Int) async throws -> [Person] {
        let personModels = try await remote.requestPeopleData(page: page)
        return PeopleMapper.mapPeople(from: personModels)
    }
    
    func searchPeople(text: String) async throws -> [Person] {
        let searchPeopleModels = try await remote.requestPeopleDataBySearch(text: text)
        let personModels = searchPeopleModels.map { $0.person }
        return PeopleMapper.mapPeople(from: personModels)
    }

    func fetchPersonDetails(id: Int) async throws -> [Show] {
        let personDetailsModel = try await remote.requestPersonDetails(id: id)
        let showModels = personDetailsModel.map { $0._embedded.show }
        return ShowMapper.mapShows(from: showModels, favoriteIDs: [])
    }
    
}
