//
//  EntityViewControllerAssembler.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 20.10.2021.
//

import UIKit

class EntityViewControllerAssembler: ViewControllerAssemblerProtocol {
    
    var entity: Entity
    
    init(entity: Entity) {
        self.entity = entity
    }
    
    func create() -> UIViewController {
        let controller = EntityViewController()
        let presenter = EntityPresenter(entity: entity)
        
        controller.presenter = presenter
        presenter.viewController = controller
        return controller
    }

}
