//
//  StarshipCoordinator.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 24.11.2021.
//

import UIKit

class StarshipCoordinator {

    private var navigationController: UINavigationController
    private var vcAssembler: ViewControllerAssemblerProtocol

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        vcAssembler = StarshipViewControllerAssembler()
    }

    func start() {
        guard let child = vcAssembler.create() as? EntityViewController,
              let parent = navigationController.viewControllers.first else { return }

        if let unwelcomeChild = parent.children.first {
            unwelcomeChild.willMove(toParent: nil)
            unwelcomeChild.view.removeFromSuperview()
            unwelcomeChild.removeFromParent()
        }

        child.view.frame = parent.view.frame
        parent.view.addSubview(child.view)
        parent.addChild(child)
        child.didMove(toParent: parent)

        child.onDetails = { entity in
            self.vcAssembler = StarshipDetailViewControllerAssembler()
            guard let detailsVC = self.vcAssembler.create() as? StarshipDetailViewController else { return }
            detailsVC.presenter?.entity = entity as? StarshipData
            child.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }

}
