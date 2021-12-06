//
//  CharacterNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

protocol CharacterNetworkServiceProtocol {

    func fetchCharacters(pageIndex: Int, completion: @escaping (Result<CharacterResponse, NetworkServiceError>) -> Void)
}

class CharacterNetworkService: CharacterNetworkServiceProtocol {

    private let requestBuilder: RequestBuilderProtocol
    private let httpClient: HTTPClientProtocol

    init(httpClient: HTTPClientProtocol = HTTPClient(), requestBuilder: RequestBuilderProtocol = RequestBuilder()) {
        self.httpClient = httpClient
        self.requestBuilder = requestBuilder
    }

    func fetchCharacters(pageIndex: Int, completion: @escaping (Result<CharacterResponse, NetworkServiceError>) -> Void) {
        let request = requestBuilder.makeRequest(route: EntityRoute.characters, index: nil, page: pageIndex)
        httpClient.request(request: request, completion: completion)
    }
}
