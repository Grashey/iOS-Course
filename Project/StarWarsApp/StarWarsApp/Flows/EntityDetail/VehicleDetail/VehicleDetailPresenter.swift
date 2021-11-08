//
//  VehicleDetailPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 29.10.2021.
//

import UIKit

class VehicleDetailPresenter: VehicleDetailPresenterProtocol {
    
    weak var viewController: VehicleDetailViewController?
    
    var entity: VehicleData?
    
    func makeViewModel() -> VehicleViewModel? {
        guard let image = UIImage(named: Constants.ImageName.vehicles), let entity = entity else { return nil }
        let model = VehicleViewModel(name: entity.name,
                                     model: entity.model,
                                     vehicleClass: entity.vehicleClass,
                                     manufacturer: entity.manufacturer,
                                     costInCredits: entity.costInCredits,
                                     length: entity.length,
                                     crew: entity.crew,
                                     passengers: entity.passengers,
                                     maxAtmospheringSpeed: entity.maxAtmospheringSpeed,
                                     cargoCapacity: entity.cargoCapacity,
                                     consumables: entity.consumables,
                                     movies: entity.films,
                                     pilots: entity.pilots,
                                     image: image)
        return model
    }
}
