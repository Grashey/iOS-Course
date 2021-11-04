//
//  MoviesNetworkService.swift
//  UrlSessionApp
//
//  Created by Aleksandr Fetisov on 01.11.2021.
//

import UIKit

class MoviesNetworkService {

    let httpClient: HTTPClientProtocol

    init(httpClient: HTTPClientProtocol = HTTPClient()) {
        self.httpClient = httpClient
    }

    func fetchMovies(completion: @escaping (Result<GetMoviesResponse, NetworkServiceError>) -> Void) {
        httpClient.request(for: MoviesRoute.movies, completion: completion)
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
        httpClient.imageDataRequest(for: imageRoute, completion: completion)
    }
}
