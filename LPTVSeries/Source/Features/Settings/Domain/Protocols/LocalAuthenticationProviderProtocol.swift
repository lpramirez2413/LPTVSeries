//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
protocol LocalAuthenticationProviderProtocol {
    func biometricType() -> BiometricType
    func canEvaluate() -> Bool
    func authenticate() async throws
}
