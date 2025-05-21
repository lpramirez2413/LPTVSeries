//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import Foundation

@MainActor
final class ImageLoader: ObservableObject {
    @Published var imageData: Data?

    private let urlString: String

    init(urlString: String) {
        self.urlString = urlString
        loadImage()
    }

    private func loadImage() {
        if let cachedData = ImageCache.shared.data(for: urlString) {
            self.imageData = cachedData
            return
        }

        guard let url = URL(string: urlString) else { return }

        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                ImageCache.shared.store(data, for: urlString)
                self.imageData = data
            } catch {
                // No need to handle error here
            }
        }
    }
}
