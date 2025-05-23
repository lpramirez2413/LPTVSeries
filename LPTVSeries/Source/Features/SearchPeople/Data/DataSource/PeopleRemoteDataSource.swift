//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
class PeopleRemoteDataSource: PeopleRemoteDataSourceProtocol {

    private var httpClient: HTTPClientProtocol
    
    init (httpClient: HTTPClientProtocol = HTTPClient()) {
        self.httpClient = httpClient
    }
    
    func requestPeopleData(page: Int) async throws -> [PersonModel] {
        let query = GetPeopleRequest(page: String(page))
        do {
            return try await httpClient.request(endpoint: Endpoint.getPeople, query: query)
        } catch {
            print("error: \(error)")
            throw error
        }
    }
    
    func requestPeopleDataBySearch(text: String) async throws -> [SearchPeopleModel] {
        let query = SearchPeopleRequest(text)
        do {
            return try await httpClient.request(endpoint: Endpoint.searchPeople, query: query)
        } catch {
            print("error: \(error)")
            throw error
        }
    }
    
    func requestPersonDetails(id: Int) async throws -> [PersonDetailsModel] {
        let query = GetPersonDetailsRequest(embed: "show")
        do {
            return try await httpClient.request(endpoint: Endpoint.getPersonShows(personId: id), query: query)
        } catch {
            print("error: \(error)")
            throw error
        }
    }
    
    
}
