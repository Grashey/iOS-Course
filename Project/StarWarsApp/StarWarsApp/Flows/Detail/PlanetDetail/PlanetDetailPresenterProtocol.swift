//
//  PlanetDetailPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import Foundation

protocol PlanetDetailPresenterProtocol {

    var entity: PlanetData? { get set}
    var model: PlanetViewModel? {get}
    var specs: [[EntityShortViewModel]] {get}

    func getData()
    func getLabelTitleFor(section: Int) -> String
}
