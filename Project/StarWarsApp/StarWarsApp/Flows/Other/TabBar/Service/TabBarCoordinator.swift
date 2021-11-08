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
    lazy var movieCoordinator = MovieCoordinator(navigationController: controller.movieNavigation)
    lazy var entityCoordinator = EntityContainerCoordinator(navigationController: controller.entityNavigation)

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        movieCoordinator.start()
        entityCoordinator.start()
        window?.rootViewController = controller
    }
}
