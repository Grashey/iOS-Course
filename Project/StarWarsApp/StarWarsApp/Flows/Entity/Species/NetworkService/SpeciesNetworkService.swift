//
//  SpeciesNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.11.2021.
//

import Foundation

class SpeciesNetworkService {

    private let httpClient: EntityHTTPClientProtocol

    init(httpClient: EntityHTTPClientProtocol = EntityHTTPClient()) {
        self.httpClient = httpClient
    }

    func fetchSpecies(pageIndex: Int, completion: @escaping (Result<SpeciesResponse, NetworkServiceError>) -> Void) {
        httpClient.request(for: EntityRoute.species, page: pageIndex, completion: completion)
    }
}
