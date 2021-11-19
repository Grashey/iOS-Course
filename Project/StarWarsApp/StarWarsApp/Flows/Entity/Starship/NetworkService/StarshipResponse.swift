//
//  StarshipResponse.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

struct StarshipResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [StarshipData]
}

struct StarshipData: Decodable {
    let name: String
    let model: String
    let starshipClass: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let crew: String
    let passengers: String
    let maxAtmospheringSpeed: String
    let hyperdriveRating: String
    let MGLT: String
    let cargoCapacity: String
    let consumables: String
    let films: [String]
    let pilots: [String]
    let url: String
    let imageData: Data?
}
