//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
class ShowsRemoteDataSource: ShowsRemoteDataSourceProtocol {

    private var httpClient: HTTPClientProtocol
    
    init (httpClient: HTTPClientProtocol = HTTPClient()) {
        self.httpClient = httpClient
    }
    
    func requestShowsData(page: Int) async throws -> [ShowModel] {
        let query = GetShowsRequest(page: String(page))
        do {
            return try await httpClient.request(endpoint: Endpoint.getShows, query: query)
        } catch {
            print("error: \(error)")
            throw error
        }
    }
    
    func requestShowsDataBySearch(text: String) async throws -> [SearchShowModel] {
        let query = SearchShowsRequest(text)
        do {
            return try await httpClient.request(endpoint: Endpoint.searchShows, query: query)
        } catch {
            print("error: \(error)")
            throw error
        }
    }
    
    func requestShowDetails(id: Int) async throws -> ShowModel {
        let query = GetShowDetailsRequest(embed: ["episodes"])
        do {
            return try await httpClient.request(endpoint: Endpoint.getShowDetails(showId: id), query: query)
        } catch {
            print("error: \(error)")
            throw error
        }
    }
    
    
}
