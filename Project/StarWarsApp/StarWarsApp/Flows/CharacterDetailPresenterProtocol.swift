//
//  CharacterDetailPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 27.10.2021.
//

import Foundation

protocol CharacterDetailPresenterProtocol {

    var entity: CharacterData? {get set}
    var model: CharacterViewModel? {get}
    var specs: [[EntityShortViewModel]] {get}

    func getData()
    func getLabelTitleFor(section: Int) -> String
}
