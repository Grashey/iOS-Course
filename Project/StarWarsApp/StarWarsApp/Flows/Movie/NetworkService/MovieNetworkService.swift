//
//  MovieNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

protocol MovieNetworkServiceProtocol {

    func fetchMovies(completion: @escaping (Result<MovieResponse, NetworkServiceError>) -> Void)

    func fetchImage(for index: Int, completion: @escaping (Result<Data, NetworkServiceError>) -> Void)
}

class MovieNetworkService: MovieNetworkServiceProtocol {

    private let requestBuilder: RequestBuilderProtocol
    private let httpClient: HTTPClientProtocol

    init(httpClient: HTTPClientProtocol = HTTPClient(), requestBuilder: RequestBuilderProtocol = RequestBuilder()) {
        self.httpClient = httpClient
        self.requestBuilder = requestBuilder
    }

    func fetchMovies(completion: @escaping (Result<MovieResponse, NetworkServiceError>) -> Void) {
        let request = requestBuilder.makeRequest(route: MovieRoute.movies, index: nil, page: nil)
        httpClient.request(request: request, completion: completion)
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
        let request = requestBuilder.makeRequest(route: imageRoute, index: nil, page: nil)
        httpClient.request(request: request, completion: completion)
    }
}
