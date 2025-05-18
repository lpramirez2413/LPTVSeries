//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import XCTest
import CoreData
@testable import LPTVSeries

extension FavoriteEpisodeEntity {
    
    convenience init(id: Int32, name: String?, context: NSManagedObjectContext) {
        self.init(context: context)
        self.id = id
        self.name = name
    }
}
