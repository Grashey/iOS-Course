//
//  SpeciesDetailPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import Foundation

protocol SpeciesDetailPresenterProtocol {
    
    var model: SpeciesViewModel? {get set}
    var entityUrl: String? { get set}
}
