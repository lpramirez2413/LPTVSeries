//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import XCTest
@testable import LPTVSeries

final class APITests: XCTestCase {
    
    let host = API.host
    let api = API.api

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_buildNewsListUrl() {
        let endpoint = Endpoint.getRecents
        XCTAssertEqual(endpoint.url, API.apiPath+"/schedule")
    }

}
