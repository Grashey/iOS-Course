//
//  StarshipNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.11.2021.
//

import Foundation

class StarshipNetworkService {

    let httpClient: EntityHTTPClientProtocol

    init(httpClient: EntityHTTPClientProtocol = EntityHTTPClient()) {
        self.httpClient = httpClient
    }

    func fetchStarships(pageIndex: Int, completion: @escaping (Result<StarshipResponse, NetworkServiceError>) -> Void) {
        httpClient.request(for: EntityRoute.starships, page: pageIndex, completion: completion)
    }
}
