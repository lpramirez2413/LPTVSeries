//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(1.0)
                .padding()
            Text("Loading content")
        }
        
    }
}
