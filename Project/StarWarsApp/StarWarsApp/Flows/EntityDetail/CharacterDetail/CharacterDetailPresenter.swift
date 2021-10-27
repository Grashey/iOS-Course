//
//  CharacterDetailPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 27.10.2021.
//

import Foundation

class CharacterDetailPresenter: CharacterDetailPresenterProtocol {
    
    weak var viewController: CharacterDetailViewController?
    
    var model: CharacterViewModel?
    var entityUrl: String?
}
