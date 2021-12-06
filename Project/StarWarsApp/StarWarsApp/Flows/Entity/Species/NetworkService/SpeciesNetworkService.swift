//
//  SpeciesNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.11.2021.
//

import Foundation

class SpeciesNetworkService {

    private let requestBuilder: RequestBuilderProtocol
    private let httpClient: HTTPClientProtocol

    init(httpClient: HTTPClientProtocol = HTTPClient(), requestBuilder: RequestBuilderProtocol = RequestBuilder()) {
        self.httpClient = httpClient
        self.requestBuilder = requestBuilder
    }

    func fetchSpecies(pageIndex: Int, completion: @escaping (Result<SpeciesResponse, NetworkServiceError>) -> Void) {
        let request = requestBuilder.makeRequest(route: EntityRoute.species, index: nil, page: pageIndex)
        httpClient.request(request: request, completion: completion)
    }
}
