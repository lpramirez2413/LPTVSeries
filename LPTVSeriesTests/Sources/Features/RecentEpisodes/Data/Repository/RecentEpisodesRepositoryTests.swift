//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import XCTest
import CoreData
@testable import LPTVSeries

final class RecentEpisodesRepositoryTests: XCTestCase {
    
    var sut: RecentEpisodesRepository!
    var remoteDataSourceMock: RecentEpisodesRemoteDataSourceMock!
    var localDataSourceMock: RecentEpisodesLocalDataSourceMock!
    
    override func setUp() {
        super.setUp()
        remoteDataSourceMock = RecentEpisodesRemoteDataSourceMock()
        localDataSourceMock = RecentEpisodesLocalDataSourceMock()
        sut = RecentEpisodesRepository(remote: remoteDataSourceMock, local: localDataSourceMock)
    }

    override func tearDown() {
        sut = nil
        remoteDataSourceMock = nil
        localDataSourceMock = nil
        super.tearDown()
    }

    func test_fetchRecentEpisodes_withFavorites_shouldMarkFavoritesCorrectly() async throws {
        remoteDataSourceMock.episodeModels = [
            
            .init(
                id: 101,
                name: "Episode 1",
                image: nil,
                show: .init(
                    id: 1,
                    name: "Show 1",
                    image: nil,
                    summary: nil,
                    rating: .init(average: 1.0),
                    _embedded: nil,
                    premiered: nil,
                    genres: [],
                    schedule: nil),
                number: 1,
                season: 1,
                summary: nil),
            .init(
                id: 102,
                name: "Episode 2",
                image: nil,
                show: .init(
                    id: 1,
                    name: "Show 1",
                    image: nil,
                    summary: nil,
                    rating: .init(average: 1.0),
                    _embedded: nil,
                    premiered: nil,
                    genres: [],
                    schedule: nil),
                number: 1,
                season: 1,
                summary: nil),
            .init(
                id: 103,
                name: "Episode 3",
                image: nil,
                show: .init(
                    id: 1,
                    name: "Show 1",
                    image: nil,
                    summary: nil,
                    rating: .init(average: 1.0),
                    _embedded: nil,
                    premiered: nil,
                    genres: [],
                    schedule: nil),
                number: 1,
                season: 1,
                summary: nil)
        ]
        
        localDataSourceMock.favoriteIds = [101, 102]
        
        let episodes = try await sut.fetchRecentEpisodes(for: "foo")
        
        let favoritedEpisodes = episodes.filter {
            guard let favorite = $0.isFavorite else {
                return false
            }
            return favorite
        }
        
        XCTAssertEqual(episodes.count, 3)
        XCTAssertEqual(favoritedEpisodes.count, 2)
    }
    
}
