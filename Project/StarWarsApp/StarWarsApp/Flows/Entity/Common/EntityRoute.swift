//
//  EntityRoute.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 20.10.2021.
//

import Foundation

enum EntityRoute {
    case characters
    case planets
    case species
    case starships
    case vehicles
}

extension EntityRoute: Route {

    var parameters: [String: Int] {
        ["page": 1]
    }

    var baseURL: String {
        Constants.ApiMethods.baseUrl
    }

    var url: String {
        switch self {
        case .characters:
            return Constants.ApiMethods.characters
        case .planets:
            return Constants.ApiMethods.planets
        case .species:
            return Constants.ApiMethods.species
        case .starships:
            return Constants.ApiMethods.starships
        case .vehicles:
            return Constants.ApiMethods.vehicles
        }
    }
}
