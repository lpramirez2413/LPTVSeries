//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import CoreData
import XCTest
@testable import LPTVSeries
    
final class TestPersistenceController: ContextProvider {
    let container: NSPersistentContainer

    init(testCase: XCTestCase) {
        container = NSPersistentContainer(name: Containers.mainModel)

        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        container.persistentStoreDescriptions = [description]

        let setupExpectation = testCase.expectation(description: "Load persistent store")
        container.loadPersistentStores { _, error in
            if let error {
                XCTFail("Error loading in-memory store: \(error)")
            } else {
                setupExpectation.fulfill()
            }
        }

        testCase.wait(for: [setupExpectation], timeout: 1.0)
    }

    var viewContext: NSManagedObjectContext {
        container.viewContext
    }

    func newBackgroundContext() -> NSManagedObjectContext {
        container.newBackgroundContext()
    }
}
