//
//  MovieDetailViewControllerAssembler.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 24.10.2021.
//

import UIKit

class MovieDetailViewControllerAssembler: ViewControllerAssemblerProtocol {

    func create() -> UIViewController {
        let controller = MovieDetailViewController()
        let presenter = MovieDetailPresenter(networkService: MovieDetailNetworkService())
        controller.presenter = presenter
        presenter.viewController = controller
        return controller
    }

}
