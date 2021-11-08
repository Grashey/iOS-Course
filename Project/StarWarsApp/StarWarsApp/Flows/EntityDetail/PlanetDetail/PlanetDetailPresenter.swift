//
//  PlanetDetailPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import UIKit

class PlanetDetailPresenter: PlanetDetailPresenterProtocol {
    
    weak var viewController: PlanetDetailViewController?
    
    var entity: PlanetData?
    
    func makeViewModel() -> PlanetViewModel? {
        guard let image = UIImage(named: Constants.ImageName.planets), let entity = entity else { return nil }
        let model = PlanetViewModel(name: entity.name,
                                    diameter: entity.diameter,
                                    rotationPeriod: entity.rotationPeriod,
                                    orbitalPeriod: entity.orbitalPeriod,
                                    gravity: entity.gravity,
                                    population: entity.population,
                                    climate: entity.climate,
                                    terrain: entity.terrain,
                                    waterSurface: entity.surfaceWater,
                                    movies: entity.films,
                                    residents: entity.residents,
                                    image: image)
        return model
    }
}
