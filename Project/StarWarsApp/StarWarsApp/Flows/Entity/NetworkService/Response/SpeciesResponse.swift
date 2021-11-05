//
//  SpeciesResponse.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

struct SpeciesResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [SpeciestData]
}

struct SpeciestData: Decodable {
    let name: String
    let classification: String
    let designation: String
    let averageHeight: String
    let averageLifespan: String
    let eyeColors: String
    let hairColors: String
    let skinColors: String
    let language: String
    let homeworld: String // url
    let films: [String]
    let people: [String]
    let url: String
    var imageData: Data?
}
