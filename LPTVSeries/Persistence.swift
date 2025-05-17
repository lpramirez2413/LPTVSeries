//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "LPTVSeries")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error {
                print("An error occured while loading the persistent store: \(error)")
            } else {
                print("CoreData successfully loaded")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
