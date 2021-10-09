//
//  RootCoordinator.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.10.2021.
//

import UIKit

class RootCoordinator {

    let window: UIWindow?

    lazy var tabBarCoordinator = TabBarCoordinator(window: window)

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        tabBarCoordinator.start()
    }

}
