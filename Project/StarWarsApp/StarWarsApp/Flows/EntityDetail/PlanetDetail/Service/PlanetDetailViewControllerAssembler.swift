//
//  PlanetDetailViewControllerAssembler.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import UIKit

class PlanetDetailViewControllerAssembler: ViewControllerAssemblerProtocol {
    
    func create() -> UIViewController {
        let controller = PlanetDetailViewController()
        let presenter = PlanetDetailPresenter()
        controller.presenter = presenter
        presenter.viewController = controller
        return controller
    }

}
