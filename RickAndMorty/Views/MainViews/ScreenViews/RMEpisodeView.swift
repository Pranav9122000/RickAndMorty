//
//  RMEpisodeView.swift
//  RickAndMorty
//
//  Created by Kulkarni, Pranav on 26/02/24.
//

import SwiftUI

struct RMEpisodeView: View {
    
    @ObservedObject var vm = RMEpisodeListViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                
            }
            .navigationTitle("Episodes")
        }
    }
}

#Preview {
    RMEpisodeView()
}
