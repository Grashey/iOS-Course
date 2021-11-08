//
//  StarshipViewControllerAssembler.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.11.2021.
//

import UIKit

class StarshipViewControllerAssembler: ViewControllerAssemblerProtocol {
    
    func create() -> UIViewController {
        let controller = EntityViewController()
        let presenter = StarshipPresenter()
        controller.presenter = presenter
        presenter.viewController = controller
        return controller
    }

}
