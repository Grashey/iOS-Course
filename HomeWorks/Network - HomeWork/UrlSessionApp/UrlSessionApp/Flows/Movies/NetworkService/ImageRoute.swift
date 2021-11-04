//
//  ImageRoute.swift
//  UrlSessionApp
//
//  Created by Aleksandr Fetisov on 01.11.2021.
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
            return Constants.MoviePostersUrl.baseUrl
        }
    }

    var url: String {
        switch self {
        case .episodeOne:
            return Constants.MoviePostersUrl.episodeOne
        case .episodeTwo:
            return Constants.MoviePostersUrl.episodeTwo
        case .episodeThree:
            return Constants.MoviePostersUrl.episodeThree
        case .episodeFour:
            return Constants.MoviePostersUrl.episodeFour
        case .episodeFive:
            return Constants.MoviePostersUrl.episodeFive
        case .episodeSix:
            return Constants.MoviePostersUrl.episodeSix
        }
    }
}
