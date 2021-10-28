//
//  StarshipDetailPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import Foundation

protocol StarshipDetailPresenterProtocol {
    
    var model: StarshipViewModel? {get set}
    var entityUrl: String? { get set}
}
