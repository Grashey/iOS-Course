//
//  VehicleDetailViewControllerAssembler.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 29.10.2021.
//

import UIKit

class VehicleDetailViewControllerAssembler: ViewControllerAssemblerProtocol {
    
    func create() -> UIViewController {
        let controller = VehicleDetailViewController()
        let presenter = VehicleDetailPresenter()
        controller.presenter = presenter
        presenter.viewController = controller
        return controller
    }

}
