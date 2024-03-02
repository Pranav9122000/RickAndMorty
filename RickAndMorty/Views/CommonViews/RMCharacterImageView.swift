//
//  RMCharacterImageView.swift
//  RickAndMorty
//
//  Created by Kulkarni, Pranav on 28/02/24.
//

import SwiftUI
import Kingfisher

struct RMCharacterImageView: View {
    
    @StateObject private var imageLoader = RMCharacterImageViewModel()
    var url: URL

    var body: some View {
        Group {
            if imageLoader.isLoading {
                ProgressView()
                    .frame(width: 150, height: 150)
            } else if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(color: .secondary, radius: 5)
            } else {
                Image(systemName: "exclamationmark.triangle")
                    .resizable()
            }
        }
        .onAppear {
            imageLoader.loadImage(from: url)
        }
    }
}

#Preview {
    RMCharacterImageView(url: URL(string:  "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!)
}
