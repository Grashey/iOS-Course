//
//  StarshipNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.11.2021.
//

import Foundation

class StarshipNetworkService {

    private let requestBuilder: RequestBuilderProtocol
    private let httpClient: HTTPClientProtocol

    init(httpClient: HTTPClientProtocol = HTTPClient(), requestBuilder: RequestBuilderProtocol = RequestBuilder()) {
        self.httpClient = httpClient
        self.requestBuilder = requestBuilder
    }

    func fetchStarships(pageIndex: Int, completion: @escaping (Result<StarshipResponse, NetworkServiceError>) -> Void) {
        let request = requestBuilder.makeRequest(route: EntityRoute.starships, index: nil, page: pageIndex)
        httpClient.request(request: request, completion: completion)
    }
}
