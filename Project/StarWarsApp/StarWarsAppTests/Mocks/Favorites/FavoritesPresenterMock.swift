//
//  FavoritesPresenterMock.swift
//  StarWarsAppTests
//
//  Created by Aleksandr Fetisov on 02.12.2021.
//

@testable import StarWarsApp
import Foundation

class FavoritesPresenterMock: FavoritesPresenterProtocol {

    var viewModel: [EntityShortViewModel] = []

    var getDataWasCalled = false

    func getData() {
        getDataWasCalled = true
    }

    var makeModelsWasCalled = false

    func makeModels() {
        makeModelsWasCalled = true
    }

    var removeAllWasCalled = false

    func removeAll() {
        removeAllWasCalled = true
    }

}
