//
//  CharacterDetailNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 08.11.2021.
//

import Foundation

class CharacterDetailNetworkService {

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

    func fetchSpecies(index: String, completion: @escaping (Result<SpeciesData, NetworkServiceError>) -> Void) {
        let request = requestBuilder.makeRequest(route: EntityRoute.species, index: index, page: nil)
        httpClient.request(request: request, completion: completion)
    }

    func fetchStarship(index: String, completion: @escaping (Result<StarshipData, NetworkServiceError>) -> Void) {
        let request = requestBuilder.makeRequest(route: EntityRoute.starships, index: index, page: nil)
        httpClient.request(request: request, completion: completion)
    }

    func fetchVehicle(index: String, completion: @escaping (Result<VehicleData, NetworkServiceError>) -> Void) {
        let request = requestBuilder.makeRequest(route: EntityRoute.vehicles, index: index, page: nil)
        httpClient.request(request: request, completion: completion)
    }
}
