//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import Foundation

struct Person: Equatable, Hashable {
    let id: Int
    let name: String
    let infoUrl: String?
    let country: Country?
    let imageUrl: String?
    let imageOriginalUrl: String?
    let birthDate: Date?
    let gender: String?
    var shows: [Show]
}
