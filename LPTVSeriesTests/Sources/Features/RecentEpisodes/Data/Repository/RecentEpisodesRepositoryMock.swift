//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import XCTest
import CoreData
@testable import LPTVSeries

final class RecentEpisodesRepositoryMock: RecentEpisodesRepositoryProtocol {
    
    var episodes: [Episode] = []
    var error: Error?
    
    func fetchRecentEpisodes(for country: String) async throws -> [Episode] {
        if let error {
            throw error
        }
        return episodes
    }
    
    
}
