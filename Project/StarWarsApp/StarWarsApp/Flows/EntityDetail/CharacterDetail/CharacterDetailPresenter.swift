//
//  CharacterDetailPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 27.10.2021.
//

import UIKit

class CharacterDetailPresenter: CharacterDetailPresenterProtocol {
    
    weak var viewController: CharacterDetailViewController?
    
    var entity: CharacterData?
    
    func makeViewModel() -> CharacterViewModel? {
        guard let image = UIImage(named: Constants.ImageName.characters), let entity = entity else { return nil }
        let model = CharacterViewModel(name: entity.name,
                                       birthYear: entity.birthYear,
                                       eyeColor: entity.eyeColor,
                                       gender: entity.gender,
                                       hairColor: entity.hairColor,
                                       mass: entity.mass,
                                       height: entity.height,
                                       skinColor: entity.skinColor,
                                       homeworld: entity.homeworld,
                                       movies: entity.films,
                                       species: entity.species,
                                       starships: entity.starships,
                                       vehicles: entity.vehicles,
                                       image: image
        )
        return model
    }
}
