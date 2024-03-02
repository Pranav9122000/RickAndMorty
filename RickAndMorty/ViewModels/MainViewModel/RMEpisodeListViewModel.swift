//
//  RMEpisodeListViewModel.swift
//  RickAndMorty
//
//  Created by Kulkarni, Pranav on 02/03/24.
//

import Foundation

class RMEpisodeListViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var episodes: [RMEpisodeModel] = []
    @Published var apiInfo: Info? = nil
    @Published var isLoadingMore = false
    @Published var count = 1
    
    init() {
        fetchEpisodes()
    }

    func fetchEpisodes() {
        let urlRequest = "https://rickandmortyapi.com/api/episode?page=\(count)"
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: urlRequest)!) { data ,_ , error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(RMGetAllEpisodesResponseModel.self, from: data!)
                let oldEpisodes = self.episodes
                DispatchQueue.main.async {
                    self.episodes = oldEpisodes + jsonData.results
                    
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
}
