//
//  MovieViewModel.swift
//  UrlSessionApp
//
//  Created by Aleksandr Fetisov on 01.11.2021.
//

import UIKit

struct MovieViewModel {
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
