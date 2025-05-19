//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    

import SwiftUI

struct ErrorView: View {
    
    var title: String
    
    var body: some View {
        Text("An error occured: \(title)")
    }
}

#Preview {
    ErrorView(title: "Error 1")
}

