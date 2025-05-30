//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
class RecentEpisodesRemoteDataSource: RecentEpisodesRemoteDataSourceProtocol {
    
    private var httpClient: HTTPClientProtocol
    
    init (httpClient: HTTPClientProtocol = HTTPClient()) {
        self.httpClient = httpClient
    }
    
    func requestRecentEpisodesData(by country: String) async throws -> [EpisodeModel] {
        let query = GetRecentEpisodesRequest(country: country)
        do {
            return try await httpClient.request(endpoint: Endpoint.getRecents, query: query)
        } catch {
            print("error: \(error)")
            throw error
        }
    }
    
}
