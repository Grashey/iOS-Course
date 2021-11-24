//
//  CharacterResponse.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

struct CharacterResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [CharacterData]
}

struct CharacterData: Decodable {
    let name: String
    let birthYear: String
    let eyeColor: String
    let gender: String
    let hairColor: String
    let mass: String
    let height: String
    let skinColor: String
    let homeworld: String
    let films: [String]
    let species: [String]
    let starships: [String]
    let vehicles: [String]
    let url: String
    let imageData: Data?
}

extension CharacterData: TransferDataProtocol {}
