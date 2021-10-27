//
//  CharacterViewModel.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 20.10.2021.
//

import Foundation

struct CharacterViewModel {
    
    let name: String
    let birthYear: String
    let eyeColor: String
    let gender: String
    let hairColor: String
    let mass: String
    let height: String
    let skinColor: String
    let homeworld: String
    let movies: [String]? = nil
    let planets: [String]? = nil
    let species: [String]? = nil
    let starships: [String]? = nil
    let vehicles: [String]? = nil
}
