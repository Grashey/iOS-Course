//
//  CharacterDetailPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 27.10.2021.
//

import UIKit

protocol CharacterDetailPresenterProtocol {

    var entity: CharacterData? {get set}
    var model: CharacterViewModel? {get}
    var specs: [[EntityShortViewModel]] {get}

    func getData()
    func makeLabelFor(section: Int) -> UILabel
}
