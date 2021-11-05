//
//  PlanetResponse.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

struct PlanetResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PlanetData]
}

struct PlanetData: Decodable {
    let name: String
    let diameter: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let gravity: String
    let population: String
    let climate: String
    let terrain: String
    let surfaceWater: String
    let films: [String]
    let residents: [String]?
    let url: String
    var imageData: Data?
}
