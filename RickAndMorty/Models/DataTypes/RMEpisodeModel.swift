//
//  RMEpisodeModel.swift
//  RickAndMorty
//
//  Created by Kulkarni, Pranav on 26/02/24.
//

import Foundation

struct RMEpisodeModel: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
