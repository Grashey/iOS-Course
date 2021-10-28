//
//  SpeciesDetailPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import Foundation

class SpeciesDetailPresenter: SpeciesDetailPresenterProtocol {
    
    weak var viewController: SpeciesDetailViewController?
    
    var model: SpeciesViewModel?
    var entityUrl: String?
}
