//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import Foundation

class SettingsViewModel: ObservableObject {
    
    //MARK: Private properties
    private let checkBiometricsUseCase: CheckBiometricCapabilityUseCaseProtocol
    private let enableBiometricsUseCase: EnableBiometricsUseCaseProtocol
    
    //MARK: Public properties
    @Published var biometricTitle: String = ""
    @Published var biometricsError: AuthenticationError?
    @Published var isBiometricsEnabled: Bool = false
        
    init(
        checkBiometricsUseCase: CheckBiometricCapabilityUseCaseProtocol = CheckBiometricCapabilityUseCase(),
        enableBiometricsUseCase: EnableBiometricsUseCaseProtocol = EnableBiometricsUseCase()
    ) {
        self.checkBiometricsUseCase = checkBiometricsUseCase
        self.enableBiometricsUseCase = enableBiometricsUseCase
        setUpInitialValues()
    }
    
    private func setUpInitialValues() {
        guard let isBiometricsEnabled: Bool = LocalStorage.getValue(forKey: LocalStorage.Constants.biometricsEnabledKey) else {
            LocalStorage.saveValue(false, forKey: LocalStorage.Constants.biometricsEnabledKey)
            return
        }
        LocalStorage.saveValue(isBiometricsEnabled, forKey: LocalStorage.Constants.biometricsEnabledKey)
        self.isBiometricsEnabled = isBiometricsEnabled
    }
    
    func checkBiometricsAvailability() {
        if checkBiometricsUseCase.canEvaluate() {
            switch checkBiometricsUseCase.biometricType() {
            case .faceID:
                biometricTitle = "Face ID"
            case .touchID:
                biometricTitle = "Touch ID"
            case .none:
                biometricTitle = "Unavailable"
            }
        }
    }
    
    @MainActor
    func updateBiometricsStatus(enabled: Bool) {
        guard enabled else {
            LocalStorage.saveValue(false, forKey: LocalStorage.Constants.biometricsEnabledKey)
            return
        }
        
        Task {
            do {
                try await enableBiometricsUseCase.execute()
                LocalStorage.saveValue(true, forKey: LocalStorage.Constants.biometricsEnabledKey)
            } catch let error as AuthenticationError {
                biometricsError = error
            } catch {
                print("Unknown error")
            }
        }
    }

}
