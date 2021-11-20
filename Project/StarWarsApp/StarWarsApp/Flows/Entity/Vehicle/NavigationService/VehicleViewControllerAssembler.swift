//
//  VehicleViewControllerAssembler.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.11.2021.
//

import UIKit

class VehicleViewControllerAssembler: ViewControllerAssemblerProtocol {

    func create() -> UIViewController {
        let controller = EntityViewController()
        let presenter = VehiclePresenter()
        controller.presenter = presenter
        presenter.viewController = controller
        return controller
    }

}
