//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    

import SwiftUI

struct MainView: View {
    
    var body: some View {
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
                Text("Favorites")
            }
            .tabItem {
                Label("Favorites", systemImage: "star")
            }

            NavigationStack {
                Text("Settings")
            }
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
    }
}

#Preview {
    MainView()
}
