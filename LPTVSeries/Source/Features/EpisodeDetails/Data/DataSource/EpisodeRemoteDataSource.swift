//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
class EpisodeRemoteDataSource: EpisodesRemoteDataSourceProtocol {
    
    private var httpClient: HTTPClientProtocol
    
    init (httpClient: HTTPClientProtocol = HTTPClient()) {
        self.httpClient = httpClient
    }
    
    func requestEpisodeDetails(id: Int) async throws -> EpisodeModel {
        do {
            return try await httpClient.request(endpoint: Endpoint.getEpisodeDetails(episodeId: id))
        } catch {
            print("error: \(error)")
            throw error
        }
    }
    
}

