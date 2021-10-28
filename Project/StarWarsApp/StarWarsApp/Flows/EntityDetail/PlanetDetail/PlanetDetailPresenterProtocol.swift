//
//  PlanetDetailPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import Foundation

protocol PlanetDetailPresenterProtocol {
    
    var model: PlanetViewModel? {get set}
    var entityUrl: String? { get set}
}
