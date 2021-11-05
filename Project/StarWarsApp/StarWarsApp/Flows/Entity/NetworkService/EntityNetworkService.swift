//
//  EntityNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

class EntityNetworkService {

    let httpClient: HTTPClientProtocol
    let imageDataLoader: ImageDataLoaderProtocol

    init(httpClient: HTTPClientProtocol = HTTPClient(), imageDataLoader: ImageDataLoaderProtocol = ImageDataLoader()) {
        self.httpClient = httpClient
        self.imageDataLoader = imageDataLoader
    }

    func fetchCharacters(pageIndex: Int, completion: @escaping (Result<CharacterResponse, NetworkServiceError>) -> Void) {
        httpClient.request(for: EntityRoute.characters, page: pageIndex, completion: completion)
    }
    
    func fetchPlanets(pageIndex: Int, completion: @escaping (Result<PlanetResponse, NetworkServiceError>) -> Void) {
        httpClient.request(for: EntityRoute.planets, page: pageIndex, completion: completion)
    }
    
    func fetchSpecies(pageIndex: Int, completion: @escaping (Result<SpeciesResponse, NetworkServiceError>) -> Void) {
        httpClient.request(for: EntityRoute.species, page: pageIndex, completion: completion)
    }
    
    func fetchStarships(pageIndex: Int, completion: @escaping (Result<StarshipResponse, NetworkServiceError>) -> Void) {
        httpClient.request(for: EntityRoute.starships, page: pageIndex, completion: completion)
    }
    
    func fetchVehicles(pageIndex: Int, completion: @escaping (Result<VehicleResponse, NetworkServiceError>) -> Void) {
        httpClient.request(for: EntityRoute.vehicles, page: pageIndex, completion: completion)
    }
    
    func fetchImage(pageIndex: Int, for index: Int, completion: @escaping (Result<Data, NetworkServiceError>) -> Void) {
//        var imageRoute: MovieImageRoute
//
//        switch index {
//        case 0:
//            imageRoute = MovieImageRoute.episodeOne
//        case 1:
//            imageRoute = MovieImageRoute.episodeTwo
//        case 2:
//            imageRoute = MovieImageRoute.episodeThree
//        case 3:
//            imageRoute = MovieImageRoute.episodeFour
//        case 4:
//            imageRoute = MovieImageRoute.episodeFive
//        case 5:
//            imageRoute = MovieImageRoute.episodeSix
//        default: return
//        }
//        imageDataLoader.request(for: imageRoute, completion: completion)
    }
}
