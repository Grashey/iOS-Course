//
//  PlanetViewControllerAssembler.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.11.2021.
//

import UIKit

class PlanetViewControllerAssembler: ViewControllerAssemblerProtocol {

    func create() -> UIViewController {
        let controller = EntityViewController()
        let presenter = PlanetPresenter()
        controller.presenter = presenter
        presenter.viewController = controller
        return controller
    }

}
