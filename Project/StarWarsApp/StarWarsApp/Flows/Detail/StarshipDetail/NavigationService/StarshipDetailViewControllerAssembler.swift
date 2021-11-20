//
//  StarshipDetailViewControllerAssembler.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import UIKit

class StarshipDetailViewControllerAssembler: ViewControllerAssemblerProtocol {

    func create() -> UIViewController {
        let controller = StarshipDetailViewController()
        let presenter = StarshipDetailPresenter()
        controller.presenter = presenter
        presenter.viewController = controller
        return controller
    }

}
