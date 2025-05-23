//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import XCTest
@testable import LPTVSeries

final class RecentEpisodesRemoteDataSourceTests: XCTestCase {
    
    var sut: RecentEpisodesRemoteDataSource!
    var httpClient: HTTPClient!
    var mockUrlSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        mockUrlSession = MockURLSession()
        httpClient = HTTPClient(session: mockUrlSession)
        sut = RecentEpisodesRemoteDataSource(httpClient: httpClient)
    }

    override func tearDown() {
        sut = nil
        httpClient = nil
        mockUrlSession = nil
        super.tearDown()
    }

    func test_fetchRecentEpisodesData() async throws {
        let jsonString = """
        [
          {
            "id": 1,
            "name": "Episode One",
            "image": null,
            "show": null,
            "number": 1,
            "season": 1,
            "summary": "First episode summary."
          },
          {
            "id": 2,
            "name": "Episode Two",
            "image": null,
            "show": null,
            "number": 2,
            "season": 1,
            "summary": null
          }
        ]
        """

        mockUrlSession.mockResponse = (jsonString: jsonString, statusCode: 200)
        
        let episodes: [EpisodeModel] = try await sut.requestRecentEpisodesData(by: "US")
        XCTAssertEqual(episodes.count, 2)
        XCTAssertEqual(episodes.first?.id, 1)
        XCTAssertEqual(episodes.last?.id, 2)
    }

}
