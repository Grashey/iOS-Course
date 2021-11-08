//
//  CharacterDetailNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 08.11.2021.
//

import Foundation

class CharacterDetailNetworkService {

    let httpClient: EntityDetailHTTPClientProtocol

    init(httpClient: EntityDetailHTTPClientProtocol = EntityDetailHTTPClient()) {
        self.httpClient = httpClient
    }

    func fetchHomeworld(index: String, completion: @escaping (Result<PlanetData, NetworkServiceError>) -> Void) {
        httpClient.request(for: EntityRoute.planets, index: index, completion: completion)
    }
}
