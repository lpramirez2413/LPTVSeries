//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import CoreData
@testable import LPTVSeries

final class RecentEpisodesLocalDataSourceMock: RecentEpisodesLocalDataSourceProtocol {
    
    var favoriteIds: [Int] = []
    var error: Error?
    
    func getFavoriteIds() throws -> [Int] {
        if let error {
            throw error
        }
        
        return favoriteIds
    }
    
}
