//
//  ImageRoute.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

enum ImageRoute {
    case episodeOne
    case episodeTwo
    case episodeThree
    case episodeFour
    case episodeFive
    case episodeSix
}

extension ImageRoute: Route {
    
    var baseURL: String {
        switch self {
        default:
            return Constants.MoviePosterUrl.baseUrl
        }
    }

    var url: String {
        switch self {
        case .episodeOne:
            return Constants.MoviePosterUrl.episodeOne
        case .episodeTwo:
            return Constants.MoviePosterUrl.episodeTwo
        case .episodeThree:
            return Constants.MoviePosterUrl.episodeThree
        case .episodeFour:
            return Constants.MoviePosterUrl.episodeFour
        case .episodeFive:
            return Constants.MoviePosterUrl.episodeFive
        case .episodeSix:
            return Constants.MoviePosterUrl.episodeSix
        }
    }
}
