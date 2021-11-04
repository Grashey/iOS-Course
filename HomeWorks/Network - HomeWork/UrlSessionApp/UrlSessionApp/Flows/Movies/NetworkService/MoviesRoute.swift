//
//  MoviesRoute.swift
//  UrlSessionApp
//
//  Created by Aleksandr Fetisov on 01.11.2021.
//

import Foundation

enum MoviesRoute {
    case movies
}

extension MoviesRoute: Route {
    
    var baseURL: String {
        switch self {
        default:
            return Constants.ApiMethods.baseUrl
        }
    }

    var url: String {
        switch self {
        case .movies:
            return Constants.ApiMethods.movies
        }
    }
}
