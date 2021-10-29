//
//  EntityCoordinator.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 20.10.2021.
//

import UIKit

class EntityCoordinator {

    var navigationController: UINavigationController
    var vcAssembler: ViewControllerAssemblerProtocol

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        vcAssembler = EntityViewControllerAssembler()
    }

    func start() {
        guard let controller = vcAssembler.create() as? EntityViewController else { return }
        navigationController.viewControllers = [controller]
        
        controller.onSwitchEntity = {
            controller.presenter?.entity = $0
            controller.presenter?.getData()
        }
        
        controller.onDetails = { entity, entityUrl in
            switch entity {
            case .characters:
                self.vcAssembler = CharacterDetailViewControllerAssembler()
                guard let detailsVC = self.vcAssembler.create() as? CharacterDetailViewController else { return }
                detailsVC.presenter?.entityUrl = entityUrl
                self.navigationController.pushViewController(detailsVC, animated: true)
            case .planets:
                self.vcAssembler = PlanetDetailViewControllerAssembler()
                guard let detailsVC = self.vcAssembler.create() as? PlanetDetailViewController else { return }
                detailsVC.presenter?.entityUrl = entityUrl
                self.navigationController.pushViewController(detailsVC, animated: true)
            case .species:
                self.vcAssembler = SpeciesDetailViewControllerAssembler()
                guard let detailsVC = self.vcAssembler.create() as? SpeciesDetailViewController else { return }
                detailsVC.presenter?.entityUrl = entityUrl
                self.navigationController.pushViewController(detailsVC, animated: true)
            case .starships:
                self.vcAssembler = StarshipDetailViewControllerAssembler()
                guard let detailsVC = self.vcAssembler.create() as? StarshipDetailViewController else { return }
                detailsVC.presenter?.entityUrl = entityUrl
                self.navigationController.pushViewController(detailsVC, animated: true)
            case .vehicles:
                self.vcAssembler = VehicleDetailViewControllerAssembler()
                guard let detailsVC = self.vcAssembler.create() as? VehicleDetailViewController else { return }
                detailsVC.presenter?.entityUrl = entityUrl
                self.navigationController.pushViewController(detailsVC, animated: true)
            }
        }
    }
}
