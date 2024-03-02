//
//  RMCharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Kulkarni, Pranav on 27/02/24.
//

import Foundation
import Combine

class RMCharacterListViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var characters: [RMCharacterModel] = []
    @Published var apiInfo: Info? = nil
    @Published var isLoadingMore = false
    @Published var count = 1
    
    func fetchCharacters() {
        let urlRequest = "https://rickandmortyapi.com/api/character/?page=\(count)"
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: urlRequest)!) { data ,_ , error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(RMGetAllCharactersResponseModel.self, from: data!)
                let oldCharacters = self.characters
                DispatchQueue.main.async {
                    self.characters = oldCharacters + jsonData.results
                    
                    self.isLoading = true
                    
                    self.isLoadingMore = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        self.count += 1
                    })
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }

    init() {
        fetchCharacters()
    }
}
