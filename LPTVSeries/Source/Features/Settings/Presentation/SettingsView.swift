//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    

import SwiftUI

struct SettingsView: View {
    
    // MARK: Private properties
    @StateObject private var viewModel: SettingsViewModel = SettingsViewModel()
    
    var body: some View {
        List {
            if !viewModel.biometricTitle.isEmpty {
                Toggle(isOn: $viewModel.isBiometricsEnabled) {
                    Text(viewModel.biometricTitle)
                }
                .onChange(of: viewModel.isBiometricsEnabled) { _, newValue in
                    viewModel.updateBiometricsStatus(enabled: newValue)
                }
            } else {
                Text("Biometrics not available on this device.")
            }
            
        }
        .onAppear(perform: viewModel.checkBiometricsAvailability)
        .navigationTitle("Settings")
        .alert("Error", isPresented: Binding(
            get: { viewModel.biometricsError != nil },
            set: { newValue in
                if !newValue {
                    viewModel.biometricsError = nil
                }
            }
        )) {
            Button("OK", role: .cancel) {
                viewModel.biometricsError = nil
            }
        } message: {
            if let errorDescription = viewModel.biometricsError?.errorDescription {
                Text(errorDescription)
            } else {
                Text("Something went wrong. Please try again.")
            }
        }
    }
    
    
    
}

#Preview {
    SettingsView()
}
