//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import CoreData

class FavoritesLocalDataSource: FavoritesLocalDataSourceProtocol {

    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getFavoriteShows() throws -> [FavoriteShowEntity] {
        try context.performAndWait {
            let request: NSFetchRequest<FavoriteShowEntity> = FavoriteShowEntity.fetchRequest()
            return try context.fetch(request)
        }
    }
    
    func removeFavoriteShow(showId: Int) throws {
        try context.performAndWait {
            let request: NSFetchRequest<FavoriteShowEntity> = FavoriteShowEntity.fetchRequest()
            request.predicate = NSPredicate(format: "id == %d", showId)
            let results = try context.fetch(request)
            for object in results {
                context.delete(object)
            }
            try context.save()
        }
    }
    
}
