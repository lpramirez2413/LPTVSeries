//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import CoreData

class RecentEpisodesLocalDataSource: RecentEpisodesLocalDataSourceProtocol {
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getFavoriteIds() throws -> [Int] {
        var ids: [Int] = []
        try context.performAndWait {
            let request: NSFetchRequest<FavoriteEpisodeEntity> = FavoriteEpisodeEntity.fetchRequest()
            let results = try context.fetch(request)
            ids = results.map { Int($0.id) }
        }
        return ids
    }
    
}
