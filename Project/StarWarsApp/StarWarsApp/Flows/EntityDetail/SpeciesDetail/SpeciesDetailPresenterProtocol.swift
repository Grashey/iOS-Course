//
//  SpeciesDetailPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import Foundation

protocol SpeciesDetailPresenterProtocol {
    
    var entity: SpeciesData? { get set}
    
    func makeViewModel() -> SpeciesViewModel?
}
