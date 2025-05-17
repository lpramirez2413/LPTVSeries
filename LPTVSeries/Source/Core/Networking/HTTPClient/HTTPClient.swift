//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import Foundation

struct EmptyCodable: Codable {}

struct HTTPClient: HTTPClientProtocol {
    
    private var session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func request<T: Decodable>(
        endpoint: EndpointProtocol
    ) async throws -> T {
        try await performRequest(endpoint: endpoint, query: nil as EmptyCodable?, body: nil as EmptyCodable?)
    }

    func request<T: Decodable, Q: Encodable>(
        endpoint: EndpointProtocol,
        query: Q
    ) async throws -> T {
        try await performRequest(endpoint: endpoint, query: query, body: nil as EmptyCodable?)
    }

    func request<T: Decodable, B: Encodable>(
        endpoint: EndpointProtocol,
        body: B
    ) async throws -> T {
        try await performRequest(endpoint: endpoint, query: nil as EmptyCodable?, body: body)
    }
    
    //MARK: - Private helper
    
    private func performRequest<T: Decodable, Q: Encodable, B: Encodable>(
                endpoint: EndpointProtocol,
                query: Q?,
                body: B?
        ) async throws -> T {
        
        guard var components = URLComponents(string: endpoint.url) else {
            throw APIError.invalidURL
        }
        
        if let queryParams = query {
            components.queryItems = try queryParams.asQueryItems()
        }
        
        guard let url = components.url else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod.rawValue
        
        if let bodyParams = body {
            if endpoint.httpMethod == .get {
                throw APIError.invalidRequest
            }
            request.httpBody = try JSONEncoder().encode(bodyParams)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        let (data, urlResponse) = try await session.data(for: request)
        
        guard let response = urlResponse as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        guard (200...299).contains(response.statusCode) else {
            throw APIError.failureResponse(statusCode: response.statusCode)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
}

extension Encodable {
    func asQueryItems() throws -> [URLQueryItem] {
        let data = try JSONEncoder().encode(self)
        let dictionary = try JSONDecoder().decode([String: String?].self, from: data)

        return dictionary.compactMap { key, value in
            guard let value = value else { return nil }
            return URLQueryItem(name: key, value: value)
        }
    }
}
