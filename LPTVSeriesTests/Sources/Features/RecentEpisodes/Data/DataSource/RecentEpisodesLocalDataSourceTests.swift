//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import XCTest
import CoreData
@testable import LPTVSeries

final class RecentEpisodesLocalDataSourceTests: XCTestCase {
    
    var sut: RecentEpisodesLocalDataSource!
    var context: NSManagedObjectContext!
    
    override func setUp() {
        super.setUp()
        context = ContainerStub.makeInMemoryContext(testCase: self)
        sut = RecentEpisodesLocalDataSource(context: context)
    }

    override func tearDown() {
        sut = nil
        context = nil
        super.tearDown()
    }

    func test_fetchRecentEpisodesData() async throws {
        let idsToSave = [101, 102, 103]
        
        idsToSave.forEach {
            let entity = FavoriteEpisodeEntity(context: context)
            entity.id = Int32($0)
        }
        
        try context.save()

        let ids = try sut.getFavoriteIds()

        XCTAssertEqual(ids.count, 3)
        XCTAssertEqual(Set(ids), Set([101, 102, 103]))
    }
    
}
