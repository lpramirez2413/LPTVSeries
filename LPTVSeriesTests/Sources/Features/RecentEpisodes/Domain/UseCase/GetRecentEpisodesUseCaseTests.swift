//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import XCTest
import CoreData
@testable import LPTVSeries

final class GetRecentEpisodesUseCaseTests: XCTestCase {
    
    var sut: GetRecentEpisodesUseCase!
    var repositoryMock: RecentEpisodesRepositoryMock!
    
    override func setUp() {
        super.setUp()
        repositoryMock = RecentEpisodesRepositoryMock()
        sut = GetRecentEpisodesUseCase(repository: repositoryMock)
    }

    override func tearDown() {
        sut = nil
        repositoryMock = nil
        super.tearDown()
    }

    func test_execute_whenSucceeds_returnEpisodes() async throws {
        repositoryMock.episodes = [
            .init(id: 101, name: "Episode 1", posterUrl: nil, isFavorite: false, number: 1, season: 1, summary: nil),
            .init(id: 102, name: "Episode 2", posterUrl: nil, isFavorite: false, number: 2, season: 1, summary: nil)
        ]
        let episodes = try await sut.execute(by: "US")
        
        XCTAssertEqual(episodes.count, 2)
    }
    
    func test_execute_whenFailsFor404_shouldThrowANotFoundError() async {
        repositoryMock.error = APIError.failureResponse(statusCode: 404)
        
        do {
            _ = try await sut.execute(by: "US")
            XCTFail("An error was expected")
        } catch let error as AppError {
            XCTAssertEqual(error, .notFound)
        } catch {
            XCTFail("An AppError but expected, instead: \(error)")
        }
        
    }
    
    func test_execute_whenFailsFor500_shouldThrowANotFoundError() async {
        repositoryMock.error = APIError.failureResponse(statusCode: 500)
        
        do {
            _ = try await sut.execute(by: "US")
            XCTFail("An error was expected")
        } catch let error as AppError {
            XCTAssertEqual(error, .serverError)
        } catch {
            XCTFail("An AppError but expected, instead: \(error)")
        }
        
    }
    
}
