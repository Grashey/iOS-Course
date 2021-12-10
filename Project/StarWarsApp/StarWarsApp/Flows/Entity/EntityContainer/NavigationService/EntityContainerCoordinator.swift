//
//  EntityContainerCoordinator.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.11.2021.
//

import UIKit

class EntityContainerCoordinator: CoordinatorProtocol {

    private var navigationController: UINavigationController
    private lazy var coordinator: CoordinatorProtocol = CharacterCoordinator(navigationController: navigationController)

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let controller = EntityContainerViewController()
        navigationController.viewControllers = [controller]

        controller.onEntity = { entity in
            switch entity {
            case .characters:
                self.coordinator = CharacterCoordinator(navigationController: self.navigationController)
                self.coordinator.start()
            case .planets:
                self.coordinator = PlanetCoordinator(navigationController: self.navigationController)
                self.coordinator.start()
            case .species:
                self.coordinator = SpeciesCoordinator(navigationController: self.navigationController)
                self.coordinator.start()
            case .starships:
                self.coordinator = StarshipCoordinator(navigationController: self.navigationController)
                self.coordinator.start()
            case .vehicles:
                self.coordinator = VehicleCoordinator(navigationController: self.navigationController)
                self.coordinator.start()
            }
        }
    }

}
