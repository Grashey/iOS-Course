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

    init(navigationController: UINavigationController, entity: Entity) {
        self.navigationController = navigationController
        vcAssembler = EntityViewControllerAssembler(entity: entity)
    }

    func start() {
        guard let controller = vcAssembler.create() as? EntityViewController else { return }
        navigationController.viewControllers = [controller]
        
        controller.onDetails = { entity in
//            let detailsVC = MovieDetailViewController()
//            detailsVC.model = model
//            self.navigationController.pushViewController(detailsVC, animated: true)
        }
    }
}
