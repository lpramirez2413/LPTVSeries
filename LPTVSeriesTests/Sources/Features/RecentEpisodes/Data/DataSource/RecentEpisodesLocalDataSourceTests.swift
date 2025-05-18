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
        context = TestPersistenceController(testCase: self).viewContext
        sut = RecentEpisodesLocalDataSource(context: context)
    }

    override func tearDown() {
        sut = nil
        context = nil
        super.tearDown()
    }

    func test_fetchRecentEpisodesData() async throws {
        _ = FavoriteEpisodeEntity(id: 101, name: "Episode 1", context: context)
        _ = FavoriteEpisodeEntity(id: 102, name: "Episode 2", context: context)
        _ = FavoriteEpisodeEntity(id: 103, name: "Episode 3", context: context)
        
        try context.save()

        let ids = try sut.getFavoriteIds()

        XCTAssertEqual(ids.count, 3)
        XCTAssertEqual(Set(ids), Set([101, 102, 103]))
    }
    
}
