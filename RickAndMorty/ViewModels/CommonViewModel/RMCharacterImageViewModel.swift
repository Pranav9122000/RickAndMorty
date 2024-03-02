//
//  RMCharacterImageViewModel.swift
//  RickAndMorty
//
//  Created by Kulkarni, Pranav on 29/02/24.
//

import Foundation
import Kingfisher
import SwiftUI

class RMCharacterImageViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var isLoading = true
    
    private let imageCache = ImageCache.default
    
    public func loadImage(from url: URL) {
        let cacheKey = url.absoluteString
        // Check if image is in cache
        if let cachedImage = imageCache.retrieveImageInMemoryCache(forKey: cacheKey) ?? imageCache.retrieveImageInMemoryCache(forKey: cacheKey) {
            // Image is in cache
            DispatchQueue.main.async {
                self.image = cachedImage
                self.isLoading = false
            }
            return
        }
        
        // Image is not in cache, fetch it
        let resource = KF.ImageResource(downloadURL: url)
        KingfisherManager.shared.retrieveImage(with: resource) { result in
            switch result {
            case .success(let value):
                DispatchQueue.main.async {
                    self.image = value.image
                    self.isLoading = false
                }
            case .failure(let error):
                print("Error loading image: \(error)")
            }
        }
    }
}
