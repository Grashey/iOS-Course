//
//  MovieCoordinator.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.10.2021.
//

import UIKit

class MovieCoordinator {

    var navigationController: UINavigationController
    var vcAssembler: ViewControllerAssemblerProtocol

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        vcAssembler = MovieViewControllerAssembler()
    }

    func start() {
        guard let controller = vcAssembler.create() as? MovieViewController else { return }
        navigationController.viewControllers = [controller]
        
        controller.onDetails = { model in
            self.vcAssembler = MovieDetailViewControllerAssembler()
            guard let detailsVC = self.vcAssembler.create() as? MovieDetailViewController else { return }
//            detailsVC.presenter?.model = model
            self.navigationController.pushViewController(detailsVC, animated: true)
        }
    }
}
