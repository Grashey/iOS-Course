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
    var model: CharacterViewModel?
    private var homeworld: String?
    private let service = CharacterDetailNetworkService()
    
    func getData() {
        guard let entity = entity else { return }
        let index = makeIndex(from: entity.homeworld)
        
        service.fetchHomeworld(index: index) { [weak self] result in
            DispatchQueue.main.async {
            guard let self = self else { return }
                switch result {
                case .success(let data):
                    self.homeworld = data.name
                    self.model = self.makeModel()
                    self.viewController?.makeView()
                case .failure(let error):
                    print(error.message)
                }
            }
        }
    }
    
    private func makeModel()  -> CharacterViewModel? {
        guard let homeworld = homeworld else { return nil }
        guard let image = UIImage(named: Constants.ImageName.characters), let entity = entity else { return nil }
        
        let model = CharacterViewModel(name: entity.name,
                                       birthYear: entity.birthYear,
                                       eyeColor: entity.eyeColor,
                                       gender: entity.gender,
                                       hairColor: entity.hairColor,
                                       mass: entity.mass,
                                       height: entity.height,
                                       skinColor: entity.skinColor,
                                       homeworld: homeworld,
                                       movies: entity.films,
                                       species: entity.species,
                                       starships: entity.starships,
                                       vehicles: entity.vehicles,
                                       image: image
        )
        return model
    }
    
    private func makeIndex(from string: String)  -> String {
        let lastChars = string.suffix(2)
        return String(lastChars)
    }
}
