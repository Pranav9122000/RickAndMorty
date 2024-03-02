//
//  RMCharacterGridView.swift
//  RickAndMorty
//
//  Created by Kulkarni, Pranav on 28/02/24.
//

import SwiftUI

struct RMCharacterGridView: View {
    
    @ObservedObject var vm = RMCharacterListViewModel()
    var character: RMCharacterModel
    
    var body: some View {
        VStack(spacing: 6) {
            RMCharacterImageView(url: URL(string: character.image)!)
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .shadow(color: .secondary, radius: 5)
            Text(character.name)
                .font(.headline).bold().lineLimit(1)
            HStack(spacing: 2) {
                RMCharacterStatusView(status: character.status)
            }
        }
    }
}
