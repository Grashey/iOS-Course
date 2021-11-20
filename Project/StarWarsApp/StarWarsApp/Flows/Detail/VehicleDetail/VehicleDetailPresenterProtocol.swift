//
//  VehicleDetailPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 29.10.2021.
//

import UIKit

protocol VehicleDetailPresenterProtocol {

    var entity: VehicleData? { get set}
    var model: VehicleViewModel? {get}
    var specs: [[EntityShortViewModel]] {get}

    func getData()
    func makeLabelFor(section: Int) -> UILabel
}
