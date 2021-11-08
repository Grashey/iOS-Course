//
//  VehicleDetailPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 29.10.2021.
//

import Foundation

protocol VehicleDetailPresenterProtocol {
    
    var entity: VehicleData? { get set}
    
    func makeViewModel() -> VehicleViewModel?
}
