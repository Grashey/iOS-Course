//
//  CharacterDetailPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 27.10.2021.
//

import Foundation

protocol CharacterDetailPresenterProtocol {
    
    var model: CharacterViewModel? {get set}
    var entityUrl: String? { get set}
}
