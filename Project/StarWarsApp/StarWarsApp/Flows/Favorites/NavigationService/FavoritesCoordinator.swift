//
//  FavoritesCoordinator.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 24.11.2021.
//

import UIKit

class FavoritesCoordinator: CoordinatorProtocol {

    private var navigationController: UINavigationController
    var vcAssembler: ViewControllerAssemblerProtocol

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        vcAssembler = FavoritesViewControllerAssembler()
    }

    func start() {
        guard let controller = vcAssembler.create() as? FavoritesViewController else { return }
        navigationController.viewControllers = [controller]

    }
}
