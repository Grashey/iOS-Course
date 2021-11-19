//
//  StarshipDetailPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import UIKit

protocol StarshipDetailPresenterProtocol {
    
    var entity: StarshipData? { get set}
    var model: StarshipViewModel? {get}
    var specs: [[EntityShortViewModel]] {get}
    
    func getData()
    func makeLabelFor(section: Int) -> UILabel
}
