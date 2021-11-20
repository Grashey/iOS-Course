//
//  SpeciesDetailViewControllerAssembler.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import UIKit

class SpeciesDetailViewControllerAssembler: ViewControllerAssemblerProtocol {

    func create() -> UIViewController {
        let controller = SpeciesDetailViewController()
        let presenter = SpeciesDetailPresenter()
        controller.presenter = presenter
        presenter.viewController = controller
        return controller
    }

}
