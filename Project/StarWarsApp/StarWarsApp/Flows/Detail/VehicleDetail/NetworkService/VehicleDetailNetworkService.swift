//
//  VehicleDetailNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 19.11.2021.
//

import Foundation

class VehicleDetailNetworkService {

    private let entityHttpClient: EntityDetailHTTPClientProtocol

    init(entityHttpClient: EntityDetailHTTPClientProtocol = EntityDetailHTTPClient()) {
        self.entityHttpClient = entityHttpClient
    }

    func fetchMovie(index: String, completion: @escaping (Result<MovieData, NetworkServiceError>) -> Void) {
        entityHttpClient.request(for: MovieRoute.movies, index: index, completion: completion)
    }

    func fetchCharacter(index: String, completion: @escaping (Result<CharacterData, NetworkServiceError>) -> Void) {
        entityHttpClient.request(for: EntityRoute.characters, index: index, completion: completion)
    }
}
