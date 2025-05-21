//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

protocol SearchShowsUseCaseProtocol {
    func execute(text: String) async throws -> [Show]
}
