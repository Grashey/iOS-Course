//
//  CharacterDetailNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 08.11.2021.
//

import Foundation

class CharacterDetailNetworkService {

    private let entityHttpClient: EntityDetailHTTPClientProtocol

    init(entityHttpClient: EntityDetailHTTPClientProtocol = EntityDetailHTTPClient()) {
        self.entityHttpClient = entityHttpClient
    }

    func fetchHomeworld(index: String, completion: @escaping (Result<PlanetData, NetworkServiceError>) -> Void) {
        entityHttpClient.request(for: EntityRoute.planets, index: index, completion: completion)
    }
    
    func fetchMovie(index: String, completion: @escaping (Result<MovieData, NetworkServiceError>) -> Void) {
        entityHttpClient.request(for: MovieRoute.movies, index: index, completion: completion)
    }
    
    func fetchSpecies(index: String, completion: @escaping (Result<SpeciesData, NetworkServiceError>) -> Void) {
        entityHttpClient.request(for: EntityRoute.species, index: index, completion: completion)
    }
    
    func fetchStarship(index: String, completion: @escaping (Result<StarshipData, NetworkServiceError>) -> Void) {
        entityHttpClient.request(for: EntityRoute.starships, index: index, completion: completion)
    }
    
    func fetchVehicle(index: String, completion: @escaping (Result<VehicleData, NetworkServiceError>) -> Void) {
        entityHttpClient.request(for: EntityRoute.vehicles, index: index, completion: completion)
    }
}
