//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import CoreData
import XCTest
@testable import LPTVSeries

struct ContainerStub {
    
    static func makeInMemoryContext(testCase: XCTestCase) -> NSManagedObjectContext {
        let container = NSPersistentContainer(name: Containers.mainModel)
        
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        container.persistentStoreDescriptions = [description]

        let setupExpectation = testCase.expectation(description: "Load persistent stores")
        
        container.loadPersistentStores { _, error in
            if let error {
                XCTFail("Expected persistence loaded, an error occured:  \(error)")
            } else {
                print("Tests - persistence successfully loaded")
                setupExpectation.fulfill()
            }
        }
        
        testCase.wait(for: [setupExpectation], timeout: 1.0)

        return container.viewContext
    }
    
}
