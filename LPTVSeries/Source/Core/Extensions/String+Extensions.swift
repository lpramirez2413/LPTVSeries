//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import Foundation

extension String {
    
    var flagEmoji: String? {
        let base: UInt32 = 127397
        var scalarResult = ""
        
        for char in unicodeScalars {
            guard let flagScalar = UnicodeScalar(base + char.value) else {
                return nil
            }
            scalarResult.unicodeScalars.append(flagScalar)
        }
        
        return scalarResult
    }
    
    func toReadableTime() -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "HH:mm"
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "h:mm a"
        outputFormatter.amSymbol = "am"
        outputFormatter.pmSymbol = "pm"
        
        if let date = inputFormatter.date(from: self) {
            return outputFormatter.string(from: date)
        } else {
            return self
        }
    }

    func toDate(format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.date(from: self)
    }
    
}
