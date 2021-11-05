//
//  EntityViewControllerAssembler.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 20.10.2021.
//

import UIKit

class EntityViewControllerAssembler: ViewControllerAssemblerProtocol {
    
    func create() -> UIViewController {
        let controller = EntityViewController()
        let presenter = EntityPresenter()
        
        controller.presenter = presenter
        presenter.viewController = controller
        return controller
    }

}
