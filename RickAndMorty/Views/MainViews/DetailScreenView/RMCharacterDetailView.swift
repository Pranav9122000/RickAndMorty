//
//  RMCharacterDetailView.swift
//  RickAndMorty
//
//  Created by Kulkarni, Pranav on 29/02/24.
//

import SwiftUI

struct RMCharacterDetailView: View {
    
    let character: RMCharacterModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                RMCharacterImageView(url: URL(string: character.image)!)
            }
            .navigationTitle(character.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
