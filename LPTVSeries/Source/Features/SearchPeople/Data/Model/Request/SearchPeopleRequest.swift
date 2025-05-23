//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
struct SearchPeopleRequest: Encodable {
    let q: String
    
    init(_ q: String) {
        self.q = q
    }
}
