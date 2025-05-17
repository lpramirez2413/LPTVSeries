//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import Combine
import Foundation

import Foundation

protocol HTTPClientProtocol {

    func request<T: Decodable>(
        endpoint: EndpointProtocol
    ) async throws -> T

    func request<T: Decodable, Q: Encodable>(
        endpoint: EndpointProtocol,
        query: Q
    ) async throws -> T

    func request<T: Decodable, B: Encodable>(
        endpoint: EndpointProtocol,
        body: B
    ) async throws -> T
    
}
