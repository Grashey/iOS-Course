//
//  PlanetViewModel.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 20.10.2021.
//

import Foundation

struct PlanetViewModel {
    
    let name: String
    let diameter: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let gravity: String
    let population: String
    let climate: String
    let terrain: String
    let waterSurface: String
    let movies: [String]? = nil
    let residents: [String]? = nil
}
