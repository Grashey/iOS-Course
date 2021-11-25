//
//  FavoritesViewControllerAssembler.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 24.11.2021.
//

import UIKit

class FavoritesViewControllerAssembler: ViewControllerAssemblerProtocol {

    func create() -> UIViewController {
        let controller = FavoritesViewController()
        let presenter = FavoritesPresenter()
        controller.presenter = presenter
        presenter.viewController = controller
        return controller
    }

}
