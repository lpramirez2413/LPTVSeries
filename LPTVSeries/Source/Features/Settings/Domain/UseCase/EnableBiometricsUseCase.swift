//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
final class EnableBiometricsUseCase: EnableBiometricsUseCaseProtocol {
    private let authProvider: LocalAuthenticationProviderProtocol

    init(authProvider: LocalAuthenticationProviderProtocol = LocalAuthenticationProvider()) {
        self.authProvider = authProvider
    }

    func execute() async throws {
        try await authProvider.authenticate()
    }
}
