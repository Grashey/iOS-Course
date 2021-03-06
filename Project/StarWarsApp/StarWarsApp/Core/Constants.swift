//
//  Constants.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 22.10.2021.
//

import Foundation

enum Constants {

    enum Fonts {
        static let main = "SFDistantGalaxy"
    }

    enum Entity {
        static let characters = "Characters"
        static let planets = "Planets"
        static let species = "Species"
        static let starships = "Starships"
        static let vehicles = "Vehicles"
    }

    enum ImageName {
        static let defaultIcon = "iconDefault"
        static let menuIcon = "iconMenu"
        static let backgroundImage = "backgroundLayer"
        static let characters = "iconCharacters"
        static let planets = "iconPlanets"
        static let species = "iconSpecies"
        static let starships = "iconStarships"
        static let vehicles = "iconVehicles"
    }

    enum FavoriteButtonImage {
        static let isFavorite = "heartRed"
        static let isNotFavorite = "heartBlack"
    }

    enum TabBarTitle {
        static let movies = "Movies"
        static let universe = "Universe"
        static let favorites = "Favorites"
    }

    enum ApiMethods {
        static let baseUrl = "https://swapi.dev/api/"
        static let movies = "films/"
        static let characters = "people/"
        static let species = "species/"
        static let starships = "starships/"
        static let vehicles = "vehicles/"
        static let planets = "planets/"
    }

    enum MoviePosterUrl {
        static let baseUrl = "https://lumiere-a.akamaihd.net/v1/images/"
        static let episodeOne = "Star-Wars-Phantom-Menace-I-Poster_3c1ff9eb.jpeg"
        static let episodeTwo = "Star-Wars-Attack-Clones-II-Poster_53baa2e7.jpeg"
        static let episodeThree = "Star-Wars-Revenge-Sith-III-Poster_646108ce.jpeg"
        static let episodeFour = "Star-Wars-New-Hope-IV-Poster_c217085b.jpeg"
        static let episodeFive = "Star-Wars-Empire-Strikes-Back-V-Poster_878f7fce.jpeg"
        static let episodeSix = "Star-Wars-Return-Jedi-VI-Poster_a10501d2.jpeg"
    }

    enum AlertTitle {
        static let message = "??????????????, ??????-???? ?????????? ???? ??????!"
        static let okey = "OK"
    }
}
