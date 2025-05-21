//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import SwiftUI

struct AsyncImageView: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: ImageResource

    init(url: String, placeholder: ImageResource = .phShow) {
        _loader = StateObject(wrappedValue: ImageLoader(urlString: url))
        self.placeholder = placeholder
    }

    var body: some View {
        Group {
            if let data = loader.imageData, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
            } else {
                Image(placeholder)
                    .resizable()
            }
        }
    }
}
