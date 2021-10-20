//
//  MovieViewModel.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.10.2021.
//

import Foundation

struct MovieViewModel {
    let title: String
    let episodeNumber: Int
    let annotation: String
    let director: String
    let producer: String
    let releaseDate: String
    let characters: [String]? = nil
    let planets: [String]? = nil
    let species: [String]? = nil
    let starships: [String]? = nil
    let vehicles: [String]? = nil
}
