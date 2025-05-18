//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    

import CoreData

class PersistenceController: ContextProvider {
    static let shared = PersistenceController()

    let container: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        container.viewContext
    }

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: Containers.mainModel)
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error {
                print("An error occured while loading the persistent store: \(error)")
            } else {
                print("CoreData successfully loaded")
            }
        })

        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func newBackgroundContext() -> NSManagedObjectContext {
        container.newBackgroundContext()
    }
}

protocol ContextProvider {
    var viewContext: NSManagedObjectContext { get }
    func newBackgroundContext() -> NSManagedObjectContext
}

enum Containers {
    static let mainModel: String = "LPTVSeries"
}
