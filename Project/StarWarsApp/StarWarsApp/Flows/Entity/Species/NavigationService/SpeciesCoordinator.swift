//
//  SpeciesCoordinator.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 24.11.2021.
//

import UIKit

class SpeciesCoordinator: CoordinatorProtocol {

    private var navigationController: UINavigationController
    private var vcAssembler: ViewControllerAssemblerProtocol

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        vcAssembler = SpeciesViewControllerAssembler()
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
            guard let detailsVC = SpeciesDetailViewControllerAssembler().create() as? SpeciesDetailViewController else { return }
            detailsVC.presenter?.entity = entity as? SpeciesData
            child.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}
