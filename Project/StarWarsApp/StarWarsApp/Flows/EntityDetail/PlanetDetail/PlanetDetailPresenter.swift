//
//  PlanetDetailPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import Foundation

class PlanetDetailPresenter: PlanetDetailPresenterProtocol {
    
    weak var viewController: PlanetDetailViewController?
    
    var model: PlanetViewModel?
    var entityUrl: String?
}
