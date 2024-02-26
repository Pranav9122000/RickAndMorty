//
//  RMContentView.swift
//  RickAndMorty
//
//  Created by Kulkarni, Pranav on 26/02/24.
//

import SwiftUI

struct RMContentView: View {
    var body: some View {
        ZStack {
            TabView {
                RMCharacterView()
                    .tabItem {
                        VStack {
                            Image(systemName: "person")
                            Text("Characters")
                        }
                    }
                
                RMLocationView()
                    .tabItem {
                        VStack {
                            Image(systemName: "globe")
                            Text("Locations")
                        }
                    }
                
                RMEpisodeView()
                    .tabItem {
                        VStack {
                            Image(systemName: "play.rectangle")
                            Text("Episodes")
                        }
                    }
                
                RMSettingsView()
                    .tabItem {
                        VStack {
                            Image(systemName: "gear")
                            Text("Settings")
                        }
                    }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    RMContentView()
}
