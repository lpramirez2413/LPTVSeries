//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import Foundation

protocol CheckBiometricCapabilityUseCaseProtocol {
    func biometricType() -> BiometricType
    func canEvaluate() -> Bool
}
