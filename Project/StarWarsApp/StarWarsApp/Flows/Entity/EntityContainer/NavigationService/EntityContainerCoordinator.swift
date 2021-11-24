//
//  EntityContainerCoordinator.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.11.2021.
//

import UIKit

class EntityContainerCoordinator {

    private var navigationController: UINavigationController
    private lazy var characterCoordinator = CharacterCoordinator(navigationController: navigationController)
    private lazy var planetCoordinator = PlanetCoordinator(navigationController: navigationController)
    private lazy var speciesCoordinator = SpeciesCoordinator(navigationController: navigationController)
    private lazy var starshipCoordinator = StarshipCoordinator(navigationController: navigationController)
    private lazy var vehicleCoordinator = VehicleCoordinator(navigationController: navigationController)

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let controller = EntityContainerViewController()
        navigationController.viewControllers = [controller]

        controller.onEntity = { entity in
            switch entity {
            case .characters: self.characterCoordinator.start()
            case .planets: self.planetCoordinator.start()
            case .species: self.speciesCoordinator.start()
            case .starships: self.starshipCoordinator.start()
            case .vehicles: self.vehicleCoordinator.start()
            }
        }
    }

}
