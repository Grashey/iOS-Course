//
//  MovieDetailViewControllerMock.swift
//  StarWarsAppTests
//
//  Created by Aleksandr Fetisov on 01.12.2021.
//

import Foundation
@testable import StarWarsApp

class MovieDetailViewControllerMock: MovieDetailViewControllerProtocol {

    var invokedIsLoadingSetter = false
    var invokedIsLoadingGetter = false
    var stubbedIsLoading = false

    var isLoading: Bool {
        get {
            invokedIsLoadingGetter = true
            return stubbedIsLoading
        }
        set {
            invokedIsLoadingSetter = true
            stubbedIsLoading = newValue
        }
    }

    var reloadTableWasCalled = false

    func reloadTable() {
        reloadTableWasCalled = true
    }

    var reloadCellWasCalled = false

    func reloadCell(index: Int) {
        reloadCellWasCalled = true
    }

    var showAlertWasCalled = false

    func showAlert(message: String) {
        showAlertWasCalled = true
    }

}
