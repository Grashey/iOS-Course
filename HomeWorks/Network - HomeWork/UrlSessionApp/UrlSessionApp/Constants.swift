//
//  Constants.swift
//  UrlSessionApp
//
//  Created by Aleksandr Fetisov on 01.11.2021.
//

import Foundation

enum Constants {
    enum ApiMethods {
        static let baseUrl = "https://swapi.dev/api/"
        static let movies = "films/"
        static let characters = "people/"
        static let species = "species/"
        static let starships = "starships/"
        static let vehicles = "vehicles/"
    }
    
    enum MoviePostersUrl {
        static let baseUrl = "https://lumiere-a.akamaihd.net/v1/images/"
        static let episodeOne = "Star-Wars-Phantom-Menace-I-Poster_3c1ff9eb.jpeg"
        static let episodeTwo = "Star-Wars-Attack-Clones-II-Poster_53baa2e7.jpeg"
        static let episodeThree = "Star-Wars-Revenge-Sith-III-Poster_646108ce.jpeg"
        static let episodeFour = "Star-Wars-New-Hope-IV-Poster_c217085b.jpeg"
        static let episodeFive = "Star-Wars-Empire-Strikes-Back-V-Poster_878f7fce.jpeg"
        static let episodeSix = "Star-Wars-Return-Jedi-VI-Poster_a10501d2.jpeg"
    }
}
