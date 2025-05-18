//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import CoreData
@testable import LPTVSeries

final class RecentEpisodesRemoteDataSourceMock: RecentEpisodesRemoteDataSourceProtocol {

    var episodeModels: [EpisodeModel] = []
    var error: Error?
    
    func requestRecentEpisodesData(by country: String) async throws -> [EpisodeModel] {
        if let error {
            throw error
        }
        return episodeModels
    }

}
