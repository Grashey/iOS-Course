//
//  PlanetCoordinator.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 24.11.2021.
//

import UIKit

class PlanetCoordinator {

    private var navigationController: UINavigationController
    private var vcAssembler: ViewControllerAssemblerProtocol

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        vcAssembler = PlanetViewControllerAssembler()
    }

    func start() {
        guard let child = vcAssembler.create() as? EntityViewController,
              let parent = navigationController.viewControllers.first else { return }

        if let unwelcomeChild = parent.children.first as? EntityViewController {
            unwelcomeChild.presenter = nil
            unwelcomeChild.willMove(toParent: nil)
            unwelcomeChild.view.removeFromSuperview()
            unwelcomeChild.removeFromParent()
        }

        child.view.frame = parent.view.frame
        parent.view.addSubview(child.view)
        parent.addChild(child)
        child.didMove(toParent: parent)

        child.onDetails = { entity in
            self.vcAssembler = PlanetDetailViewControllerAssembler()
            guard let detailsVC = self.vcAssembler.create() as? PlanetDetailViewController else { return }
            detailsVC.presenter?.entity = entity as? PlanetData
            child.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}
