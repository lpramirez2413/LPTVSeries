//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import Foundation

class CheckBiometricCapabilityUseCase: CheckBiometricCapabilityUseCaseProtocol {
    
    private let authProvider: LocalAuthenticationProviderProtocol

    init(authProvider: LocalAuthenticationProviderProtocol = LocalAuthenticationProvider()) {
        self.authProvider = authProvider
    }
    
    func biometricType() -> BiometricType {
        authProvider.biometricType()
    }

    func canEvaluate() -> Bool {
        authProvider.canEvaluate()
    }

}
