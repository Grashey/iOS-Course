//
//  MovieResponse.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

struct MovieResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [MovieData]
}

struct MovieData: Decodable {
    let episodeId: Int
    let title: String
    let openingCrawl: String
    let director: String
    let producer: String
    let releaseDate: String
    let characters: [String]
    let planets: [String]
    let starships: [String]
    let vehicles: [String]
    let species: [String]
    let created: String
    let edited: String
    let url: String
}
