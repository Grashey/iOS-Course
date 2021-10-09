//
//  MovieCoordinator.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.10.2021.
//

import UIKit

class MovieCoordinator {

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let controller = MovieViewController()
        let presenter = MoviePresenter()
        controller.presenter = presenter
        presenter.viewController = controller
        navigationController.viewControllers = [controller]
    }
}
