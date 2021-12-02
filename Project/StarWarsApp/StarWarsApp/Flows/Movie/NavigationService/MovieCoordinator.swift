//
//  MovieCoordinator.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.10.2021.
//

import UIKit

class MovieCoordinator: CoordinatorProtocol {

    private var navigationController: UINavigationController
    private var vcAssembler: ViewControllerAssemblerProtocol

    init(navigationController: UINavigationController, vcAssembler: ViewControllerAssemblerProtocol) {
        self.navigationController = navigationController
        self.vcAssembler = vcAssembler
    }

    func start() {
        guard let controller = vcAssembler.create() as? MovieViewController else { return }
        navigationController.viewControllers = [controller]

        controller.onDetails = {
            self.vcAssembler = MovieDetailViewControllerAssembler()
            guard let detailsVC = self.vcAssembler.create() as? MovieDetailViewController else { return }
            detailsVC.presenter?.movie = $0
            self.navigationController.pushViewController(detailsVC, animated: true)
        }
    }
}
