//
//  SpeciesDetailNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 19.11.2021.
//

import Foundation

class SpeciesDetailNetworkService {

    private let requestBuilder: RequestBuilderProtocol
    private let httpClient: HTTPClientProtocol

    init(httpClient: HTTPClientProtocol = HTTPClient(), requestBuilder: RequestBuilderProtocol = RequestBuilder()) {
        self.httpClient = httpClient
        self.requestBuilder = requestBuilder
    }

    func fetchHomeworld(index: String, completion: @escaping (Result<PlanetData, NetworkServiceError>) -> Void) {
        let request = requestBuilder.makeRequest(route: EntityRoute.planets, index: index, page: nil)
        httpClient.request(request: request, completion: completion)
    }

    func fetchMovie(index: String, completion: @escaping (Result<MovieData, NetworkServiceError>) -> Void) {
        let request = requestBuilder.makeRequest(route: MovieRoute.movies, index: index, page: nil)
        httpClient.request(request: request, completion: completion)
    }

    func fetchCharacter(index: String, completion: @escaping (Result<CharacterData, NetworkServiceError>) -> Void) {
        let request = requestBuilder.makeRequest(route: EntityRoute.characters, index: index, page: nil)
        httpClient.request(request: request, completion: completion)
    }
}
