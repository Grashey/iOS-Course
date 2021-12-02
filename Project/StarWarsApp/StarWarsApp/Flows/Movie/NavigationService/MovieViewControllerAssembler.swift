//
//  MovieViewControllerAssembler.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 20.10.2021.
//

import UIKit

class MovieViewControllerAssembler: ViewControllerAssemblerProtocol {

    func create() -> UIViewController {
        let controller = MovieViewController()
        let presenter = MoviePresenter(networkService: MovieNetworkService(), imageKeeper: MoviePosterKeeper())
        controller.presenter = presenter
        presenter.viewController = controller
        return controller
    }

}
