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
        super.tearDown()
    }

    func test_fetchRecentEpisodesData() async throws {
        let jsonString = """
        [
          {
            "id": 1,
            "name": "Episode One",
            "image": null,
            "show": {
              "id": 101,
              "genres": ["Comedy", "Action"]
            },
            "summary": "First episode summary."
          },
          {
            "id": 2,
            "name": "Episode Two",
            "image": "https://dummyimage.com/200x300",
            "show": {
              "id": 102,
              "genres": ["Horror"]
            },
            "summary": null
          }
        ]
        """

        mockUrlSession.mockResponse = (jsonString: jsonString, statusCode: 200)
        
        let episodes: [EpisodeModel] = try await sut.fetchRecentEpisodesData(by: "US")
        XCTAssertEqual(episodes.count, 2)
        XCTAssertEqual(episodes.first?.id, 1)
        XCTAssertEqual(episodes.last?.id, 2)
    }

}
