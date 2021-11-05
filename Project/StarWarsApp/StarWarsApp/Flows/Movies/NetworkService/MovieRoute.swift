//
//  MovieRoute.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

enum MovieRoute {
    case movies
}

extension MovieRoute: Route {
    
    var baseURL: String {
        Constants.ApiMethods.baseUrl
    }

    var url: String {
        switch self {
        case .movies:
            return Constants.ApiMethods.movies
        }
    }
}
