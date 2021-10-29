//
//  VehicleDetailPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 29.10.2021.
//

import Foundation

class VehicleDetailPresenter: VehicleDetailPresenterProtocol {
    
    weak var viewController: VehicleDetailViewController?
    
    var model: VehicleViewModel?
    var entityUrl: String?
}
