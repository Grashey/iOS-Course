//
//  CharacterViewControllerAssembler.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 20.10.2021.
//

import UIKit

class CharacterViewControllerAssembler: ViewControllerAssemblerProtocol {

    func create() -> UIViewController {
        let controller = EntityViewController()
        let presenter = CharacterPresenter()
        controller.presenter = presenter
        presenter.viewController = controller
        return controller
    }

}
