//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    

import Foundation
@testable import LPTVSeries

final class MockURLSession: URLSessionProtocol {
    var mockResponse: (jsonString: String, statusCode: Int)?
    var stubbedError: Error?
    
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        if let stubbedError {
            throw stubbedError
        }
        
        guard let mockResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard let encodedData = mockResponse.jsonString.data(using: .utf8) else {
            throw URLError(.cannotDecodeRawData)
        }
        
        guard let url = URL(string: "https://mock.url"),
              let urlResponse = HTTPURLResponse(url: url,
                                                statusCode: mockResponse.statusCode,
                                                httpVersion: nil,
                                                headerFields: nil) else {
            throw URLError(.cannotParseResponse)
        }
        
        return (encodedData, urlResponse)
    }
}
