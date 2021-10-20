//
//  StarshipViewModel.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 20.10.2021.
//

import Foundation

struct StarshipViewModel: EntityShortViewModelProtocol {
    var name: String
    
    let model: String
    let starshipClass: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let crew: String
    let passengers: String
    let maxAtmospheringSpeed: String
    let hyperdriveRating: String
    let maxNumberOfMegalights: String
    let cargoCapacity: String
    let consumables: String
    let movies: [String]? = nil
    let pilots: [String]? = nil
}
