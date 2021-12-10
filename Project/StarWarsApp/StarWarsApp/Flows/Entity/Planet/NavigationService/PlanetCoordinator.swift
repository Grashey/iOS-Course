//
//  PlanetCoordinator.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 24.11.2021.
//

import UIKit

class PlanetCoordinator: CoordinatorProtocol {

    private var navigationController: UINavigationController
    private var vcAssembler: ViewControllerAssemblerProtocol

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        vcAssembler = PlanetViewControllerAssembler()
    }

    func start() {
        guard let child = vcAssembler.create() as? EntityViewController,
              let parent = navigationController.viewControllers.first else { return }

        if let childToRemove = parent.children.first {
            childToRemove.willMove(toParent: nil)
            childToRemove.view.removeFromSuperview()
            childToRemove.removeFromParent()
        }

        child.view.frame = parent.view.frame
        parent.view.addSubview(child.view)
        parent.addChild(child)
        child.didMove(toParent: parent)

        child.onDetails = { [weak child] entity in
            guard let detailsVC = PlanetDetailViewControllerAssembler().create() as? PlanetDetailViewController else { return }
            detailsVC.presenter?.entity = entity as? PlanetData
            child?.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}
