//
//  MoviePresenter.swift
//  StarWarsAppTests
//
//  Created by Aleksandr Fetisov on 27.11.2021.
//

import Foundation
@testable import StarWarsApp

class MoviePresenterMock: MoviePresenterProtocol {

    var movies: [MovieData] = []
    var viewModels: [MovieViewModel] = []

    var getDataWasCalled = false

    func getData() {
        getDataWasCalled = true
    }

}
