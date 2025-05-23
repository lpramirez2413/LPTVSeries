//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import Foundation

struct PersonModel: Decodable {
    let id: Int
    let name: String
    let url: String?
    let country: CountryModel?
    let image: ImageModel?
    let _embedded: EmbeddedModel?
    let birthday: String?
    let gender: String?
    
    struct CountryModel: Decodable {
        let name: String
        let code: String
    }
    
    struct EmbeddedModel: Decodable {
        let show: [ShowModel]
    }
 
}
