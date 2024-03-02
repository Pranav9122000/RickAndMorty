//
//  RMGetAllCharactersResponseModel.swift
//  RickAndMorty
//
//  Created by Kulkarni, Pranav on 27/02/24.
//

import Foundation

struct RMGetAllCharactersResponseModel: Codable {
    let info: Info
    let results: [RMCharacterModel]
}

struct Info: Codable {
    var count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
