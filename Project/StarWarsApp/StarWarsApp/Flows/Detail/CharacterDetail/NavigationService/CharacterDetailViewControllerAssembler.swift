//
//  CharacterDetailViewControllerAssembler.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import UIKit

class CharacterDetailViewControllerAssembler: ViewControllerAssemblerProtocol {

    func create() -> UIViewController {
        let controller = CharacterDetailViewController()
        let presenter = CharacterDetailPresenter()
        controller.presenter = presenter
        presenter.viewController = controller
        return controller
    }

}
