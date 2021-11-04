//
//  GetMoviesResponse.swift
//  UrlSessionApp
//
//  Created by Aleksandr Fetisov on 01.11.2021.
//

import Foundation

struct GetMoviesResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [GetMoviesDataResponse]
}

struct GetMoviesDataResponse: Decodable {
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
