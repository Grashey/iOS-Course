//
//  MovieDetailViewModel.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.10.2021.
//

import UIKit

struct MovieDetailViewModel {
    let title: String
    let episodeNumber: Int
    let annotation: String
    let director: String
    let producer: String
    let releaseDate: String
    let characters: [String]
    let planets: [String]
    let species: [String]
    let starships: [String]
    let vehicles: [String]
    var image: UIImage?
}
