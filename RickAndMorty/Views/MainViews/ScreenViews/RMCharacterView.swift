//
//  RMCharacterView.swift
//  RickAndMorty
//
//  Created by Kulkarni, Pranav on 26/02/24.
//

import SwiftUI

struct RMCharacterView: View {
    
    @ObservedObject var vm = RMCharacterListViewModel()
    private let adaptiveColumns = [
            GridItem(.adaptive(minimum: 140))
        ]
    var count: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                if !vm.isLoading {
                    ProgressView()
                        .controlSize(.large)
                } else {
                    ScrollView {
                        LazyVGrid(columns: adaptiveColumns, alignment: .center) {
                            ForEach(vm.characters) { item in
                                NavigationLink(destination: RMCharacterDetailView(character: item)) {
                                    RMCharacterGridView(character: item)
                                        .padding(.all, 16)
                                }
                                .foregroundStyle(Color.accentColor)
                                .onAppear {
                                    if item == vm.characters.last {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                                            vm.isLoadingMore = true
                                        })
                                        vm.fetchCharacters()
                                    }
                                }
                            }
                            .background(.secondary.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.bottom, 8)
                        }
                        .padding(.horizontal, 4)
                        
                        if vm.isLoadingMore {
                            ProgressView()
                        }
                    }
                }
            }
            .navigationTitle("Characters")
        }
    }
}

#Preview {
    RMCharacterView()
}
