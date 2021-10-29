//
//  VehicleDetailPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 29.10.2021.
//

import Foundation

protocol VehicleDetailPresenterProtocol {
    
    var model: VehicleViewModel? {get set}
    var entityUrl: String? { get set}
}
