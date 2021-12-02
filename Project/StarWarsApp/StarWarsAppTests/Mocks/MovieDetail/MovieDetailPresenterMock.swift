//
//  MovieDetailPresenterMock.swift
//  StarWarsAppTests
//
//  Created by Aleksandr Fetisov on 02.12.2021.
//

import Foundation
@testable import StarWarsApp

class MovieDetailPresenterMock: MovieDetailPresenterProtocol {

    var model: MovieDetailViewModel?
    var movie: MovieData?
    var specs: [[EntityShortViewModel]] = []

    var getLabelTitleForWasCalled = false

    func getLabelTitleFor(section: Int) -> String {
        getLabelTitleForWasCalled = true
        return String()
    }

    var getDataWasCalled = false

    func getData() {
        getDataWasCalled = true
    }

}
