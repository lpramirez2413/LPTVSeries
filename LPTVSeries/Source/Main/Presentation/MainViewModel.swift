//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import Foundation

class MainViewModel: ObservableObject {
    
    //MARK: Private properties
    private let enableBiometricsUseCase: EnableBiometricsUseCaseProtocol
    
    //MARK: Public properties
    @Published var isBlockedByBiometrics: Bool = false
    @Published var hasPassedBiometrics: Bool = false
        
    init(
        enableBiometricsUseCase: EnableBiometricsUseCaseProtocol = EnableBiometricsUseCase()
    ) {
        self.enableBiometricsUseCase = enableBiometricsUseCase
        setUpInitialValues()
    }
    
    private func setUpInitialValues() {
        guard let hasSetBiometrics: Bool = LocalStorage.getValue(forKey: LocalStorage.Constants.biometricsEnabledKey) else {
            LocalStorage.saveValue(false, forKey: LocalStorage.Constants.biometricsEnabledKey)
            return
        }
        LocalStorage.saveValue(hasSetBiometrics, forKey: LocalStorage.Constants.biometricsEnabledKey)
        self.isBlockedByBiometrics = hasSetBiometrics
    }
    
    @MainActor
    func requestAccessWithBiometrics() {
        Task {
            do {
                try await enableBiometricsUseCase.execute()
                hasPassedBiometrics = true
            } catch {
                print("Unknown error")
            }
        }
    }
    

}
