//
//  StarshipDetailPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import Foundation

class StarshipDetailPresenter: StarshipDetailPresenterProtocol {
    
    weak var viewController: StarshipDetailViewController?
    
    var model: StarshipViewModel?
    var entityUrl: String?
}
