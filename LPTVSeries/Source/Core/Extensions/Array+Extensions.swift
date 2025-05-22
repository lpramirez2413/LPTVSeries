//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import Foundation

extension Array where Element == String {
    func formattedDayDescription() -> String {
        let lowercasedDays = self.map { $0.lowercased() }
        let weekdays = Set(["monday", "tuesday", "wednesday", "thursday", "friday"])
        let weekends = Set(["saturday", "sunday"])
        let inputSet = Set(lowercasedDays)

        if inputSet == weekdays {
            return "On weekdays"
        } else if inputSet == weekends {
            return "On weekends"
        } else {
            return self.joined(separator: ", ")
        }
    }
}
