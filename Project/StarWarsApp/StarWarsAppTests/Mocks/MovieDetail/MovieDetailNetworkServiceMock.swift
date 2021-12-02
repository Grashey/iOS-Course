//
//  MovieDetailNetworkServiceMock.swift
//  StarWarsAppTests
//
//  Created by Aleksandr Fetisov on 01.12.2021.
//

import Foundation
@testable import StarWarsApp

class MovieDetailNetworkServiceMock: MovieDetailNetworkServiceProtocol {

    var invokedFetchCharacter = false
    var stubbedFetchCharacterCompletionResult: Result<CharacterData, NetworkServiceError>?

    func fetchCharacter(index: String, completion: @escaping (Result<CharacterData, NetworkServiceError>) -> Void) {
        invokedFetchCharacter = true
        if let result = stubbedFetchCharacterCompletionResult {
            completion(result)
        }
    }

    var invokedFetchPlanet = false
    var stubbedFetchPlanetCompletionResult: Result<PlanetData, NetworkServiceError>?

    func fetchPlanet(index: String, completion: @escaping (Result<PlanetData, NetworkServiceError>) -> Void) {
        invokedFetchPlanet = true
        if let result = stubbedFetchPlanetCompletionResult {
            completion(result)
        }
    }

    var invokedFetchSpecies = false
    var stubbedFetchSpeciesCompletionResult: Result<SpeciesData, NetworkServiceError>?

    func fetchSpecies(index: String, completion: @escaping (Result<SpeciesData, NetworkServiceError>) -> Void) {
        invokedFetchSpecies = true
        if let result = stubbedFetchSpeciesCompletionResult {
            completion(result)
        }
    }

    var invokedFetchStarship = false
    var stubbedFetchStarshipCompletionResult: Result<StarshipData, NetworkServiceError>?

    func fetchStarship(index: String, completion: @escaping (Result<StarshipData, NetworkServiceError>) -> Void) {
        invokedFetchStarship = true
        if let result = stubbedFetchStarshipCompletionResult {
            completion(result)
        }
    }

    var invokedFetchVehicle = false
    var stubbedFetchVehicleCompletionResult: Result<VehicleData, NetworkServiceError>?

    func fetchVehicle(index: String, completion: @escaping (Result<VehicleData, NetworkServiceError>) -> Void) {
        invokedFetchVehicle = true
        if let result = stubbedFetchVehicleCompletionResult {
            completion(result)
        }
    }

}
