//
//  MovieNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

class MovieNetworkService {

    let httpClient: HTTPClientProtocol
    let imageDataLoader: ImageDataLoaderProtocol

    init(httpClient: HTTPClientProtocol = HTTPClient(), imageDataLoader: ImageDataLoaderProtocol = ImageDataLoader()) {
        self.httpClient = httpClient
        self.imageDataLoader = imageDataLoader
    }

    func fetchMovies(completion: @escaping (Result<MovieResponse, NetworkServiceError>) -> Void) {
        httpClient.request(for: MovieRoute.movies, completion: completion)
    }
    
    func fetchImage(for index: Int, completion: @escaping (Result<Data, NetworkServiceError>) -> Void) {
        var imageRoute: ImageRoute
        
        switch index {
        case 0:
            imageRoute = ImageRoute.episodeOne
        case 1:
            imageRoute = ImageRoute.episodeTwo
        case 2:
            imageRoute = ImageRoute.episodeThree
        case 3:
            imageRoute = ImageRoute.episodeFour
        case 4:
            imageRoute = ImageRoute.episodeFive
        case 5:
            imageRoute = ImageRoute.episodeSix
        default: return
        }
        imageDataLoader.request(for: imageRoute, completion: completion)
    }
}
