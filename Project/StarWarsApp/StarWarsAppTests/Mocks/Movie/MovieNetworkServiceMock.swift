//
//  MovieNetworkServiceMock.swift
//  StarWarsAppTests
//
//  Created by Aleksandr Fetisov on 27.11.2021.
//

import Foundation
@testable import StarWarsApp

class MovieNetworkServiceMock: MovieNetworkServiceProtocol {

    var invokedFetchMovies = false
    var stubbedFetchMoviesCompletionResult: Result<MovieResponse, NetworkServiceError>?

    func fetchMovies(completion: @escaping (Result<MovieResponse, NetworkServiceError>) -> Void) {
        invokedFetchMovies = true
        if let result = stubbedFetchMoviesCompletionResult {
            completion(result)
        }
    }

    var invokedFetchImage = false
    var stubbedFetchImageCompletionResult: Result<Data, NetworkServiceError>?

    func fetchImage(for index: Int, completion: @escaping (Result<Data, NetworkServiceError>) -> Void) {
        invokedFetchImage = true
        if let result = stubbedFetchImageCompletionResult {
            completion(result)
        }
    }

}
