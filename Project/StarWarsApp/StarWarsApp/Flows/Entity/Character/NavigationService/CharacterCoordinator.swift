//
//  CharacterCoordinator.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 23.11.2021.
//

import UIKit

class CharacterCoordinator {

    private var navigationController: UINavigationController
    private var vcAssembler: ViewControllerAssemblerProtocol

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        vcAssembler = CharacterViewControllerAssembler()
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
            guard let detailsVC = CharacterDetailViewControllerAssembler().create() as? CharacterDetailViewController else { return }

            detailsVC.presenter?.entity = entity as? CharacterData
            child.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}
