//
//  MovieDetailNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 18.11.2021.
//

import Foundation

protocol MovieDetailNetworkServiceProtocol {

    func fetchCharacter(index: String, completion: @escaping (Result<CharacterData, NetworkServiceError>) -> Void)
    func fetchPlanet(index: String, completion: @escaping (Result<PlanetData, NetworkServiceError>) -> Void)
    func fetchSpecies(index: String, completion: @escaping (Result<SpeciesData, NetworkServiceError>) -> Void)
    func fetchStarship(index: String, completion: @escaping (Result<StarshipData, NetworkServiceError>) -> Void)
    func fetchVehicle(index: String, completion: @escaping (Result<VehicleData, NetworkServiceError>) -> Void)
}

class MovieDetailNetworkService: MovieDetailNetworkServiceProtocol {

    private let requestBuilder: RequestBuilderProtocol
    private let httpClient: HTTPClientProtocol

    init(httpClient: HTTPClientProtocol = HTTPClient(), requestBuilder: RequestBuilderProtocol = RequestBuilder()) {
        self.httpClient = httpClient
        self.requestBuilder = requestBuilder
    }

    func fetchCharacter(index: String, completion: @escaping (Result<CharacterData, NetworkServiceError>) -> Void) {
        let request = requestBuilder.makeRequest(route: EntityRoute.characters, index: index, page: nil)
        httpClient.request(request: request, completion: completion)
    }

    func fetchPlanet(index: String, completion: @escaping (Result<PlanetData, NetworkServiceError>) -> Void) {
        let request = requestBuilder.makeRequest(route: EntityRoute.planets, index: index, page: nil)
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
