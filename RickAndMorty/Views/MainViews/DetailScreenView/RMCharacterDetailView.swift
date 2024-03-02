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
            ScrollView(showsIndicators: false) {
                RMCharacterImageView(url: URL(string: character.image)!)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    stacks(stringName: "Status", stringValue: character.status.rawValue)
                    stacks(stringName: "Species", stringValue: character.species)
                    stacks(stringName: "Type", stringValue: character.type.isEmpty ? "_____" : character.type)
                    stacks(stringName: "Origin", stringValue: character.origin.name)
                    stacks(stringName: "Location", stringValue: character.location.name)
                }
                .padding()
                
                HStack {
                    Text("Episodes Featured  -   ")
                        .font(.system(size: 26, weight: .heavy, design: .rounded))
                    Spacer()
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(character.episode, id: \.self) { item in
                            RMCharacterEpisodeDetailView(urlString: item)
                        }
                        .shadow(color: .accent.opacity(0.2), radius: 5, x: 1, y: 5)
                    }
                    .padding(.leading, 16)
                }
                Spacer()
            }
            .navigationTitle(character.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func stacks(stringName: String, stringValue: String) -> some View {
        HStack(alignment: .center, spacing: 10) {
            Text(stringName)
            Text("-")
            Text(stringValue)
            Spacer()
        }
        .font(.system(size: 26, weight: .heavy, design: .rounded))
    }
}
