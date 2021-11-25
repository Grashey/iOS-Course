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
    var specs = [[EntityShortViewModel]]()
    private var titles = [String]()
    private let service = CharacterDetailNetworkService()
    private let keeper = DataKeeper()
    var isSaved = false {
        didSet {
            guard oldValue != isSaved else { return }
            viewController?.switchRightBarButtonItemTitle()
        }
    }

    func getData() {
        guard let entity = entity else { return }
        let array = keeper.load()
        if array.contains(entity.name) {
            isSaved = true
        } else {
            isSaved = false
        }

        prepareSpecs()
        viewController?.isLoading = true
        getHomeworld()
    }

    private func getHomeworld() {
        guard let entity = self.entity else { return }
        let index = makeIndex(from: entity.homeworld)
        self.service.fetchHomeworld(index: index) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.model = self.makeModel(with: data.name)
                    self.viewController?.tableView.reloadData()
                    self.getFilms()
                case .failure(let error):
                    self.showAlert(message: error.message)
                }
            }
        }
    }

    private func getFilms() {
        guard let element = specs.firstIndex(where: { $0.isEmpty }),
                let subIndex = specs.firstIndex(of: specs[element]),
                let entity = self.entity, !entity.films.isEmpty else {
                    getSpecies()
                    return
                }

        let movieIndexes = entity.films.map { makeIndex(from: $0)}
        let keeper = MoviePosterKeeper()
        movieIndexes.forEach { index in
            self.service.fetchMovie(index: index) { [weak self] result in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        let image = keeper.loadPoster(for: data.title)
                        let movie = EntityShortViewModel(name: data.title, image: image)
                        self.specs[subIndex].append(movie)
                        if index == movieIndexes.last {
                            let indexPath = IndexPath(item: .zero, section: subIndex + 1)
                            self.viewController?.tableView.reloadRows(at: [indexPath], with: .automatic)
                            self.getSpecies()
                        }
                    case .failure(let error):
                        self.showAlert(message: error.message)
                    }
                }
            }
        }
    }

    private func getSpecies() {
        guard let element = specs.firstIndex(where: { $0.isEmpty }),
                let subIndex = specs.firstIndex(of: specs[element]),
                let entity = self.entity, !entity.species.isEmpty else {
                    getStarships()
                    return
                }

        let speciesIndexes = entity.species.map { makeIndex(from: $0)}
        speciesIndexes.forEach { index in
            self.service.fetchSpecies(index: index) { [weak self] result in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        let image = UIImage(named: Constants.ImageName.species)
                        let species = EntityShortViewModel(name: data.name, image: image)
                        self.specs[subIndex].append(species)
                        if index == speciesIndexes.last {
                            let indexPath = IndexPath(item: .zero, section: subIndex + 1)
                            self.viewController?.tableView.reloadRows(at: [indexPath], with: .automatic)
                            self.getStarships()
                        }
                    case .failure(let error):
                        self.showAlert(message: error.message)
                    }
                }
            }
        }
    }

    private func getStarships() {
        guard let element = specs.firstIndex(where: { $0.isEmpty }),
                let subIndex = specs.firstIndex(of: specs[element]),
                let entity = self.entity, !entity.starships.isEmpty else {
                    getVehicles()
                    return
                }

        let starshipIndexes = entity.starships.map { makeIndex(from: $0)}
        starshipIndexes.forEach { index in
            self.service.fetchStarship(index: index) { [weak self] result in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        let image = UIImage(named: Constants.ImageName.starships)
                        let starship = EntityShortViewModel(name: data.name, image: image)
                        self.specs[subIndex].append(starship)
                        if index == starshipIndexes.last {
                            let indexPath = IndexPath(item: .zero, section: subIndex + 1)
                            self.viewController?.tableView.reloadRows(at: [indexPath], with: .automatic)
                            self.getVehicles()
                        }
                    case .failure(let error):
                        self.showAlert(message: error.message)
                    }
                }
            }
        }
    }

    private func getVehicles() {
        guard let element = specs.firstIndex(where: { $0.isEmpty }),
                let subIndex = specs.firstIndex(of: specs[element]),
                let entity = self.entity, !entity.vehicles.isEmpty else {
                    viewController?.isLoading = false
                    return
                }

        let vehicleIndexes = entity.vehicles.map { makeIndex(from: $0)}
        vehicleIndexes.forEach { index in
            self.service.fetchVehicle(index: index) { [weak self] result in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        let image = UIImage(named: Constants.ImageName.vehicles)
                        let vehicle = EntityShortViewModel(name: data.name, image: image)
                        self.specs[subIndex].append(vehicle)
                        if index == vehicleIndexes.last {
                            let indexPath = IndexPath(item: .zero, section: subIndex + 1)
                            self.viewController?.tableView.reloadRows(at: [indexPath], with: .automatic)
                            self.viewController?.isLoading = false
                        }
                    case .failure(let error):
                        self.viewController?.isLoading = false
                        self.showAlert(message: error.message)
                    }
                }
            }
        }
    }

    private func makeModel(with homeworld: String) -> CharacterViewModel? {
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
                                       image: image
        )
        return model
    }

    private func makeIndex(from string: String) -> String {
        let components = string.components(separatedBy: "/")
        let index = components[components.count - 2]
        return index
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: Constants.AlertTitle.message,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.AlertTitle.okey, style: .default, handler: nil))
        viewController?.present(alert, animated: true)
    }

    private func prepareSpecs() {
        var count = 0
        guard let entity = entity else { return }

        if !entity.films.isEmpty {
            count += 1
            titles.append(Constants.TabBarTitle.movies)
        }
        if !entity.species.isEmpty {
            count += 1
            titles.append(Constants.Entity.species)
        }
        if !entity.starships.isEmpty {
            count += 1
            titles.append(Constants.Entity.starships)
        }
        if !entity.vehicles.isEmpty {
            count += 1
            titles.append(Constants.Entity.vehicles)
        }
        specs = Array(repeating: [EntityShortViewModel](), count: count)
    }

    func getLabelTitleFor(section: Int) -> String {
        return titles[section]
    }

    func operateFavorites() {
        guard let entity = entity else { return }
        let array = keeper.load()
        if array.contains(entity.name) {
            keeper.remove(model: entity.name)
            isSaved = false
        } else {
            keeper.save(model: entity.name)
            isSaved = true
        }
    }
}
