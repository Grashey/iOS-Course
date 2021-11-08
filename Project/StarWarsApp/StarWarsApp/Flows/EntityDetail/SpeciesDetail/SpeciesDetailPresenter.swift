//
//  SpeciesDetailPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import UIKit

class SpeciesDetailPresenter: SpeciesDetailPresenterProtocol {
    
    weak var viewController: SpeciesDetailViewController?
    
    var entity: SpeciesData?
    
    func makeViewModel() -> SpeciesViewModel? {
        guard let image = UIImage(named: Constants.ImageName.species), let entity = entity else { return nil }
        let model = SpeciesViewModel(name: entity.name,
                                     classification: entity.classification,
                                     designation: entity.designation,
                                     averageHeight: entity.averageHeight,
                                     averageLifespan: entity.averageLifespan,
                                     eyeColors: entity.eyeColors,
                                     hairColors: entity.hairColors,
                                     skinColors: entity.skinColors,
                                     language: entity.language,
                                     homeworld: entity.homeworld,
                                     movies: entity.films,
                                     characters: entity.people,
                                     image: image)
        return model
    }
}
