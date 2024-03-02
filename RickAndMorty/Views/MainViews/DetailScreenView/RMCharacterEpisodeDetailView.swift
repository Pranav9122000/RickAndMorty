//
//  RMCharacterEpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Kulkarni, Pranav on 02/03/24.
//

import SwiftUI

struct RMCharacterEpisodeDetailView: View {
    
    var urlString: String
    @State private var characterEpisode: RMEpisodeModel?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(characterEpisode?.name ?? "") - \(characterEpisode?.episode ?? "")")
            Text("Aired Date - \(characterEpisode?.air_date ?? "")")
        }
        .onAppear {
            fetchSingleEpisode(url: urlString)
        }
        .padding(.all, 20)
        .background(.secondary.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    func fetchSingleEpisode(url: String) {
        URLSession.shared.dataTask(with: URL(string: url)!) { data, _, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(RMEpisodeModel.self, from: data!)
                DispatchQueue.main.async {
                    self.characterEpisode = jsonData
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}


