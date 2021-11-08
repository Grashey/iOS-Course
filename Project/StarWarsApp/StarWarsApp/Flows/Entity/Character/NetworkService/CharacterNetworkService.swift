//
//  CharacterNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

class CharacterNetworkService {

    let httpClient: HTTPClientProtocol

    init(httpClient: HTTPClientProtocol = HTTPClient()) {
        self.httpClient = httpClient
    }

    func fetchCharacters(pageIndex: Int, completion: @escaping (Result<CharacterResponse, NetworkServiceError>) -> Void) {
        httpClient.request(for: EntityRoute.characters, page: pageIndex, completion: completion)
    }
}
