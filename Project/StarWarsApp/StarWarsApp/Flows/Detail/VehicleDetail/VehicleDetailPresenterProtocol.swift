//
//  VehicleDetailPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 29.10.2021.
//

import Foundation

protocol VehicleDetailPresenterProtocol {

    var entity: VehicleData? { get set}
    var model: VehicleViewModel? {get}
    var specs: [[EntityShortViewModel]] {get}
    var isSaved: Bool {get set}

    func getData()
    func getLabelTitleFor(section: Int) -> String
    func operateFavorites()
}
