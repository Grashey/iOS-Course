//
//  SpeciesNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.11.2021.
//

import Foundation

class SpeciesNetworkService {

    let httpClient: HTTPClientProtocol

    init(httpClient: HTTPClientProtocol = HTTPClient()) {
        self.httpClient = httpClient
    }

    func fetchSpecies(pageIndex: Int, completion: @escaping (Result<SpeciesResponse, NetworkServiceError>) -> Void) {
        httpClient.request(for: EntityRoute.species, page: pageIndex, completion: completion)
    }
}
