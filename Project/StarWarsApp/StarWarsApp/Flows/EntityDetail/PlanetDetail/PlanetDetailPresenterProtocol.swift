//
//  PlanetDetailPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import Foundation

protocol PlanetDetailPresenterProtocol {
    
    var entity: PlanetData? { get set}
    
    func makeViewModel() -> PlanetViewModel?
}
