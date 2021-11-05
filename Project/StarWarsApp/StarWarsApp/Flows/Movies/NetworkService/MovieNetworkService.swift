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
        httpClient.request(for: MovieRoute.movies, page: nil, completion: completion)
    }
    
    func fetchImage(for index: Int, completion: @escaping (Result<Data, NetworkServiceError>) -> Void) {
        var imageRoute: MovieImageRoute
        
        switch index {
        case 0:
            imageRoute = MovieImageRoute.episodeOne
        case 1:
            imageRoute = MovieImageRoute.episodeTwo
        case 2:
            imageRoute = MovieImageRoute.episodeThree
        case 3:
            imageRoute = MovieImageRoute.episodeFour
        case 4:
            imageRoute = MovieImageRoute.episodeFive
        case 5:
            imageRoute = MovieImageRoute.episodeSix
        default: return
        }
        imageDataLoader.request(for: imageRoute, completion: completion)
    }
}
