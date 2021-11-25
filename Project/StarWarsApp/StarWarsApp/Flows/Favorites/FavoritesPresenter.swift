//
//  FavoritesPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 24.11.2021.
//

import Foundation

class FavoritesPresenter: FavoritesPresenterProtocol {

    weak var viewController: FavoritesViewController?

    var viewModel: [EntityShortViewModel] = []
    private let keeper = DataKeeper()

    func getData() {
        viewModel = keeper.load().map { EntityShortViewModel(name: $0, image: nil) }
        print(viewModel)

    }

    func makeEntity(name: String) -> TransferDataProtocol? {
        return nil
    }

}
