//
//  SpeciesDetailPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import UIKit

protocol SpeciesDetailPresenterProtocol {

    var entity: SpeciesData? { get set}
    var model: SpeciesViewModel? {get}
    var specs: [[EntityShortViewModel]] {get}

    func getData()
    func makeLabelFor(section: Int) -> UILabel
}
