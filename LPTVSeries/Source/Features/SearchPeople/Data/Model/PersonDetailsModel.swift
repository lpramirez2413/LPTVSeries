//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
struct PersonDetailsModel: Decodable {
    let _embedded: EmbeddedModel
    
    struct EmbeddedModel: Decodable {
        let show: ShowModel
    }
}
