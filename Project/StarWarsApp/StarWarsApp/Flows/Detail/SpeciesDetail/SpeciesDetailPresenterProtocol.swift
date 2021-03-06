//
//  SpeciesDetailPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import Foundation

protocol SpeciesDetailPresenterProtocol {

    var entity: SpeciesData? { get set}
    var model: SpeciesViewModel? {get}
    var specs: [[EntityShortViewModel]] {get}
    var isSaved: Bool {get set}

    func getData()
    func getLabelTitleFor(section: Int) -> String
    func operateFavorites()
    func checkIsFavorite()
}
