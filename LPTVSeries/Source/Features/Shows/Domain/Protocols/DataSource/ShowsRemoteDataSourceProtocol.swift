//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
protocol ShowsRemoteDataSourceProtocol {
    func requestShowsData(page: Int) async throws -> [ShowModel]
    func requestShowsDataBySearch(text: String) async throws -> [SearchShowModel]
    func requestShowDetails(id: Int) async throws -> ShowModel
}
