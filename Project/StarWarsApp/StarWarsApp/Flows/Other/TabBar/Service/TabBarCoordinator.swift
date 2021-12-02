//
//  TabBarCoordinator.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.10.2021.
//

import UIKit

class TabBarCoordinator {

    var window: UIWindow?
    let controller = TabBarController()
    lazy var movieCoordinator = MovieCoordinator(navigationController: controller.movieNavigation, vcAssembler: MovieViewControllerAssembler())
    lazy var entityCoordinator = EntityContainerCoordinator(navigationController: controller.entityNavigation)
    lazy var favoritesCoordinator = FavoritesCoordinator(navigationController: controller.favoritesNavigation)

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        window?.rootViewController = controller
        movieCoordinator.start()
        entityCoordinator.start()
        favoritesCoordinator.start()
    }
}
