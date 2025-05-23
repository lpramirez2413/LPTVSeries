//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//

import LocalAuthentication
    
final class LocalAuthenticationProvider: LocalAuthenticationProviderProtocol {

    private let context = LAContext()

    func biometricType() -> BiometricType {
        _ = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        switch context.biometryType {
        case .faceID: return .faceID
        case .touchID: return .touchID
        default: return .none
        }
    }

    func canEvaluate() -> Bool {
        context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
    }

    func authenticate() async throws {
        do {
            try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Enable biometric authentication")
        } catch let error as LAError {
            switch error.code {
            case .biometryNotEnrolled:
                throw AuthenticationError.userDisabled
            default:
                throw AuthenticationError.failed
            }
        } catch {
            throw AuthenticationError.failed
        }
    }
}
