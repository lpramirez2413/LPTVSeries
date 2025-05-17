//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import XCTest
@testable import LPTVSeries

final class HTTPClientTests: XCTestCase {
    
    var sut: HTTPClient!
    var mockUrlSession: MockURLSession!

    override func setUp() {
        super.setUp()
        mockUrlSession = MockURLSession()
        sut = HTTPClient(session: mockUrlSession)
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_request_whenNoQuery_andNoBody_succeeds() async throws {
        let jsonString = """
        { "bar": "foo" }
        """

        mockUrlSession.mockResponse = (jsonString: jsonString, statusCode: 200)

        let result: MockModel = try await sut.request(endpoint: MockEndpoint.fooGet)
        XCTAssert(result.bar == "foo")
    }
    
    func test_request_whenNoQuery_andNoBody_whenInvalidJSONString_fails() async {
        let jsonString = """
        { bar: "foo" }
        """

        mockUrlSession.mockResponse = (jsonString: jsonString, statusCode: 200)
        
        do {
            let _: MockModel = try await sut.request(endpoint: MockEndpoint.fooGet)
            XCTFail("Expected DecodingError, but succeeded")
        } catch is DecodingError {
            // Expectation
        } catch {
            XCTFail("Expected DecodingError, but got: \(error)")
        }
    }
    
    func test_request_whenQuery_andNoBody_succeeds() async throws {
        let jsonString = """
        { "bar": "foo" }
        """
        
        let query: MockModel = .init(bar: "foo.query")

        mockUrlSession.mockResponse = (jsonString: jsonString, statusCode: 200)

        let result: MockModel = try await sut.request(endpoint: MockEndpoint.fooGet, query: query)
        XCTAssert(result.bar == "foo")
    }
    
    func test_request_whenNoQuery_andBody_succeeds() async throws {
        let jsonString = """
        { "bar": "foo" }
        """
        
        let body: MockModel = .init(bar: "foo.body")

        mockUrlSession.mockResponse = (jsonString: jsonString, statusCode: 200)

        let result: MockModel = try await sut.request(endpoint: MockEndpoint.fooPost, body: body)
        XCTAssert(result.bar == "foo")
    }

}

