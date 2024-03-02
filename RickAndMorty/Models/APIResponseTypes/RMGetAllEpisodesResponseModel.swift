//
//  RMGetAllEpisodesResponseModel.swift
//  RickAndMorty
//
//  Created by Kulkarni, Pranav on 02/03/24.
//

import Foundation

struct RMGetAllEpisodesResponseModel: Codable {
    let info: Info
    let results: [RMEpisodeModel]
}

