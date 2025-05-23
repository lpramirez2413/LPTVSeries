//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
protocol PeopleRemoteDataSourceProtocol {
    func requestPeopleData(page: Int) async throws -> [PersonModel]
    func requestPeopleDataBySearch(text: String) async throws -> [SearchPeopleModel]
    func requestPersonDetails(id: Int) async throws -> [PersonDetailsModel]
}
