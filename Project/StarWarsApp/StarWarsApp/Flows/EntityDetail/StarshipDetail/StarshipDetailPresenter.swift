//
//  StarshipDetailPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import UIKit

class StarshipDetailPresenter: StarshipDetailPresenterProtocol {
    
    weak var viewController: StarshipDetailViewController?
    
    var entity: StarshipData?
    
    func makeViewModel() -> StarshipViewModel? {
        guard let image = UIImage(named: Constants.ImageName.starships), let entity = entity else { return nil }
        let model = StarshipViewModel(name: entity.name,
                                      model: entity.model,
                                      starshipClass: entity.starshipClass,
                                      manufacturer: entity.manufacturer,
                                      costInCredits: entity.costInCredits,
                                      length: entity.length,
                                      crew: entity.crew,
                                      passengers: entity.passengers,
                                      maxAtmospheringSpeed: entity.maxAtmospheringSpeed,
                                      hyperdriveRating: entity.hyperdriveRating,
                                      maxNumberOfMegalights: entity.MGLT,
                                      cargoCapacity: entity.cargoCapacity,
                                      consumables: entity.consumables,
                                      movies: entity.films,
                                      pilots: entity.pilots,
                                      image: image)
        return model
    }
}
