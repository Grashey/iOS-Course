//
//  EntityPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 20.10.2021.
//

import Foundation

class EntityPresenter: EntityPresenterProtocol {
    
    weak var viewController: EntityViewController?
    
    var entity = Entity.characters
    var viewModel: [EntityShortViewModel] = []
    
    func getData() {
        makeData()
        
        viewController?.navigationItem.title = getTitleName()
        
        switch entity {
        case .characters:
            let request = characters.map { CharacterViewModel(name: $0.name, birthYear: "", eyeColor: "", gender: "", hairColor: "", mass: "", height: "", skinColor: "", homeworld: "", movies: nil, species: nil, starships: nil, vehicles: nil)}
            viewModel = request.map { EntityShortViewModel(name: $0.name) }
        case .planets:
            let request = planets.map { PlanetViewModel(name: $0.name, diameter: "", rotationPeriod: "", orbitalPeriod: "", gravity: "", population: "", climate: "", terrain: "", waterSurface: "", movies: nil, residents: nil)}
            viewModel = request.map { EntityShortViewModel(name: $0.name) }
        case .species:
            let request = species.map { SpeciesViewModel(name: $0.name, classification: "", designation: "", averageHeight: "", averageLifespan: "", eyeColors: "", hairColors: "", skinColors: "", language: "", homeworld: "", movies: nil, characters: nil)}
            viewModel = request.map { EntityShortViewModel(name: $0.name) }
        case .starships:
            let request = starships.map { StarshipViewModel(name: $0.name, model: "", starshipClass: "", manufacturer: "", costInCredits: "", length: "", crew: "", passengers: "", maxAtmospheringSpeed: "", hyperdriveRating: "", maxNumberOfMegalights: "", cargoCapacity: "", consumables: "", movies: nil, pilots: nil)}
            viewModel = request.map { EntityShortViewModel(name: $0.name) }
        case .vehicles:
            let request = vehicles.map { VehicleViewModel(name: $0.name, model: "", vehicleClass: "", manufacturer: "", costInCredits: "", length: "", crew: "", passengers: "", maxAtmospheringSpeed: "", cargoCapacity: "", consumables: "")}
            viewModel = request.map { EntityShortViewModel(name: $0.name) }
        }
        
        viewController?.collectionView.scrollToItem(at: IndexPath(item: .zero, section: .zero), at: .top, animated: false)
        viewController?.collectionView.reloadData()
    }
    
    private func getTitleName() -> String {
        switch entity {
        case .characters: return Constants.Entity.characters
        case .planets: return Constants.Entity.planets
        case .species: return Constants.Entity.species
        case .starships: return Constants.Entity.starships
        case .vehicles: return Constants.Entity.vehicles
        }
    }
    
//temporary data
    var characters = [Character]()
    var planets = [Planet]()
    var starships = [Starship]()
    var vehicles = [Vehicle]()
    var species = [Species]()
    
    func makeData() {
        characters.removeAll()
        planets.removeAll()
        starships.removeAll()
        vehicles.removeAll()
        species.removeAll()
        
        for index in 1...20 {
            self.characters.append(Character(name: "\(Constants.Entity.characters) \(index)"))
            self.planets.append(Planet(name: "\(Constants.Entity.planets) \(index)"))
            self.starships.append(Starship(name: "\(Constants.Entity.starships) \(index)"))
            self.vehicles.append(Vehicle(name: "\(Constants.Entity.vehicles) \(index)"))
            self.species.append(Species(name: "\(Constants.Entity.species) \(index)"))
        }
    }
    
}

//temporary data
struct Character {
    let name: String
}

struct Planet {
    let name: String
}

struct Starship {
    let name: String
}

struct Vehicle {
    let name: String
}

struct Species {
    let name: String
}

