//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import Foundation

struct Favorite: Equatable, Hashable {
    let id: Int
    let posterUrl: String?
    let name: String?
    let rating: Double
    let summary: String?
}
