//
//  VehicleResponse.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

struct VehicleResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [VehicleData]
}

struct VehicleData: Decodable {
    let name: String
    let model: String
    let vehicleClass: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let crew: String
    let passengers: String
    let maxAtmospheringSpeed: String
    let cargoCapacity: String
    let consumables: String
    let films: [String]
    let pilots: [String]?
    let url: String
    var imageData: Data?
}
