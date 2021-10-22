//
//  EntityPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 20.10.2021.
//

import Foundation

class EntityPresenter: EntityPresenterProtocol {
    
    weak var viewController: EntityViewController?
    
    var entity: Entity?
    
    init(entity: Entity) {
        self.entity = entity
    }

    var viewModel: [EntityShortViewModel] = []
    
    func getData() {
        makeData()
        
        switch entity {
        case .characters:
            let request = characters.map { CharacterViewModel(name: $0.name, birthYear: "", eyeColor: "", gender: "", hairColor: "", mass: "", skinColor: "", homeworld: "")}
            viewModel = request.map { EntityShortViewModel(entityViewModel: $0) }
        case .planets:
            let request = planets.map { PlanetViewModel(name: $0.name, diameter: "", rotationPeriod: "", orbitalPeriod: "", gravity: "", population: "", climate: "", terrain: "", waterSurface: "")}
            viewModel = request.map { EntityShortViewModel(entityViewModel: $0) }
        case .species:
            let request = species.map { SpeciesViewModel(name: $0.name, classification: "", designation: "", averageHeight: "", averageLifespan: "", eyeColors: "", hairColors: "", skinColors: "", language: "", homeworld: "")}
            viewModel = request.map { EntityShortViewModel(entityViewModel: $0) }
        case .starships:
            let request = starships.map { StarshipViewModel(name: $0.name, model: "", starshipClass: "", manufacturer: "", costInCredits: "", length: "", crew: "", passengers: "", maxAtmospheringSpeed: "", hyperdriveRating: "", maxNumberOfMegalights: "", cargoCapacity: "", consumables: "")}
            viewModel = request.map { EntityShortViewModel(entityViewModel: $0) }
        case .vehicles:
            let request = vehicles.map { VehicleViewModel(name: $0.name, model: "", vehicleClass: "", manufacturer: "", costInCredits: "", length: "", crew: "", passengers: "", maxAtmospheringSpeed: "", cargoCapacity: "", consumables: "")}
            viewModel = request.map { EntityShortViewModel(entityViewModel: $0) }
        default:
            print("Oops")
        }
    }
    
//temporary data
    var characters = [Character]()
    var planets = [Planet]()
    var starships = [Starship]()
    var vehicles = [Vehicle]()
    var species = [Species]()
    
    func makeData() {
        for index in 1...10 {
            self.characters.append(Character(name: "Character \(index)"))
            self.planets.append(Planet(name: "Planet \(index)"))
            self.starships.append(Starship(name: "Starship \(index)"))
            self.vehicles.append(Vehicle(name: "Vehicle \(index)"))
            self.species.append(Species(name: "Species \(index)"))
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

