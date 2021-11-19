//
//  PlanetNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.11.2021.
//

import Foundation

class PlanetNetworkService {

    private let httpClient: EntityHTTPClientProtocol

    init(httpClient: EntityHTTPClientProtocol = EntityHTTPClient()) {
        self.httpClient = httpClient
    }

    func fetchPlanets(pageIndex: Int, completion: @escaping (Result<PlanetResponse, NetworkServiceError>) -> Void) {
        httpClient.request(for: EntityRoute.planets, page: pageIndex, completion: completion)
    }
}
