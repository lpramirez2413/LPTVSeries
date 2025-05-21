//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import CoreData

class ShowsLocalDataSource: ShowsLocalDataSourceProtocol {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getFavorites() throws -> [FavoriteShowEntity] {
        try context.performAndWait {
            let request: NSFetchRequest<FavoriteShowEntity> = FavoriteShowEntity.fetchRequest()
            return try context.fetch(request)
        }
    }
    
    func addFavorite(show: FavoriteShowDTO) throws {
        try context.performAndWait {
            let entity = FavoriteShowEntity(context: context)
            entity.id = Int32(show.id)
            entity.imageUrl = show.imageUrl
            entity.name = show.name
            entity.rating = show.rating
            entity.summary = show.summary
            try context.save()
        }
    }
    
    func removeFavorite(showId: Int) throws {
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
