//
//  RMCharacterModel.swift
//  RickAndMorty
//
//  Created by Kulkarni, Pranav on 26/02/24.
//

import Foundation

struct RMCharacterModel: Codable, Identifiable, Equatable {
    static func == (lhs: RMCharacterModel, rhs: RMCharacterModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: Int
    let name: String
    let status: RMCharacterStatus
    let species: String
    let type: String
    let gender: RMCharacterGender
    let origin: RMOriginModel
    let location: RMSingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}

enum RMCharacterGender: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
}

struct RMOriginModel: Codable {
    let name: String
    let url: String
}

struct RMSingleLocation: Codable {
    let name: String
    let url: String
}
