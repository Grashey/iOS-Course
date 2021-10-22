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
            controller.loadNewData()
        }
    }
}
