//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isBlockedByBiometrics {
            if viewModel.hasPassedBiometrics {
                mainContent
            } else {
                blockedContent
                    .onAppear(perform: viewModel.requestAccessWithBiometrics)
            }
        } else {
            mainContent
        }
    }
    
    var mainContent: some View {
        TabView {
            NavigationStack {
                RecentEpisodesView()
            }
            .tabItem {
                Label("Recent Episodes", systemImage: "clock")
            }

            NavigationStack {
                ShowsView()
            }
            .tabItem {
                Label("Shows", systemImage: "movieclapper")
            }

            NavigationStack {
                FavoritesView()
            }
            .tabItem {
                Label("Favorites", systemImage: "bookmark")
            }

            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
    }
    
    var blockedContent: some View {
        Text("Blocked Content")
    }
}

#Preview {
    MainView()
}
