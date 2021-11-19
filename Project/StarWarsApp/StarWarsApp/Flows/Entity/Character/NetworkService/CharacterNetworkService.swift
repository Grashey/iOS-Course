//
//  CharacterNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

class CharacterNetworkService {

    private let httpClient: EntityHTTPClientProtocol

    init(httpClient: EntityHTTPClientProtocol = EntityHTTPClient()) {
        self.httpClient = httpClient
    }

    func fetchCharacters(pageIndex: Int, completion: @escaping (Result<CharacterResponse, NetworkServiceError>) -> Void) {
        httpClient.request(for: EntityRoute.characters, page: pageIndex, completion: completion)
    }
}
