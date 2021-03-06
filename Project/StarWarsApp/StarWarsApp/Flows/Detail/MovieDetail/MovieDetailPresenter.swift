//
//  MovieDetailPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 24.10.2021.
//

import UIKit

class MovieDetailPresenter: MovieDetailPresenterProtocol {

    weak var viewController: MovieDetailViewControllerProtocol?

    var model: MovieDetailViewModel?
    var movie: MovieData?
    var specs = [[EntityShortViewModel]]()
    private var titles = [String]()
    private let networkService: MovieDetailNetworkServiceProtocol

    init(networkService: MovieDetailNetworkServiceProtocol) {
        self.networkService = networkService
    }

    func getData() {
        viewController?.isLoading = true
        model = makeModel()
        prepareSpecs()
        viewController?.reloadTable()
        getCharacter()
    }

    private func getCharacter() {
        guard let element = specs.firstIndex(where: { $0.isEmpty }),
                let subIndex = specs.firstIndex(of: specs[element]),
                let movie = self.movie, !movie.characters.isEmpty else {
                    getPlanet()
                    return
                }

        let characterIndexes = movie.characters.map { makeIndex(from: $0)}
        characterIndexes.forEach { index in
            self.networkService.fetchCharacter(index: index) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    let image = UIImage(named: Constants.ImageName.characters)
                    let character = EntityShortViewModel(name: data.name, image: image)
                    self.specs[subIndex].append(character)
                    if index == characterIndexes.last {
                        self.viewController?.reloadCell(index: subIndex + 1)
                        self.getPlanet()
                    }
                case .failure(let error):
                    self.viewController?.showAlert(message: error.message)
                }
            }
        }
    }

    private func getPlanet() {
        guard let element = specs.firstIndex(where: { $0.isEmpty }),
                let subIndex = specs.firstIndex(of: specs[element]),
                let movie = self.movie, !movie.planets.isEmpty else {
                    getSpecies()
                    return
                }

        let planetIndexes = movie.planets.map { makeIndex(from: $0)}
        planetIndexes.forEach { index in
            self.networkService.fetchPlanet(index: index) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    let image = UIImage(named: Constants.ImageName.planets)
                    let planet = EntityShortViewModel(name: data.name, image: image)
                    self.specs[subIndex].append(planet)
                    if index == planetIndexes.last {
                        self.viewController?.reloadCell(index: subIndex + 1)
                        self.getSpecies()
                    }
                case .failure(let error):
                    self.viewController?.showAlert(message: error.message)
                }
            }
        }
    }

    private func getSpecies() {
        guard let element = specs.firstIndex(where: { $0.isEmpty }),
                let subIndex = specs.firstIndex(of: specs[element]),
                let movie = self.movie, !movie.species.isEmpty else {
                    getStarships()
                    return
                }

        let speciesIndexes = movie.species.map { makeIndex(from: $0)}
        speciesIndexes.forEach { index in
            self.networkService.fetchSpecies(index: index) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    let image = UIImage(named: Constants.ImageName.species)
                    let species = EntityShortViewModel(name: data.name, image: image)
                    self.specs[subIndex].append(species)
                    if index == speciesIndexes.last {
                        self.viewController?.reloadCell(index: subIndex + 1)
                        self.getStarships()
                    }
                case .failure(let error):
                    self.viewController?.showAlert(message: error.message)
                }
            }
        }
    }

    private func getStarships() {
        guard let element = specs.firstIndex(where: { $0.isEmpty }),
                let subIndex = specs.firstIndex(of: specs[element]),
                let movie = self.movie, !movie.starships.isEmpty else {
                    getVehicles()
                    return
                }

        let starshipIndexes = movie.starships.map { makeIndex(from: $0)}
        starshipIndexes.forEach { index in
            self.networkService.fetchStarship(index: index) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    let image = UIImage(named: Constants.ImageName.starships)
                    let starship = EntityShortViewModel(name: data.name, image: image)
                    self.specs[subIndex].append(starship)
                    if index == starshipIndexes.last {
                        self.viewController?.reloadCell(index: subIndex + 1)
                        self.getVehicles()
                    }
                case .failure(let error):
                    self.viewController?.showAlert(message: error.message)
                }
            }
        }
    }

    private func getVehicles() {
        guard let element = specs.firstIndex(where: { $0.isEmpty }),
                let subIndex = specs.firstIndex(of: specs[element]),
                let movie = self.movie, !movie.vehicles.isEmpty else {
                    viewController?.isLoading = false
                    return
                }

        let vehicleIndexes = movie.vehicles.map { makeIndex(from: $0)}
        vehicleIndexes.forEach { index in
            self.networkService.fetchVehicle(index: index) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    let image = UIImage(named: Constants.ImageName.vehicles)
                    let vehicle = EntityShortViewModel(name: data.name, image: image)
                    self.specs[subIndex].append(vehicle)
                    if index == vehicleIndexes.last {
                        self.viewController?.reloadCell(index: subIndex + 1)
                        self.viewController?.isLoading = false
                    }
                case .failure(let error):
                    self.viewController?.isLoading = false
                    self.viewController?.showAlert(message: error.message)
                }
            }
        }
    }

    private func makeModel() -> MovieDetailViewModel? {
        guard let movie = movie, let data  = movie.imageData, let image = UIImage(data: data) else { return nil }
        let model = MovieDetailViewModel(title: movie.title,
                                         episodeNumber: movie.episodeId,
                                         annotation: movie.openingCrawl,
                                         director: movie.director,
                                         producer: movie.producer,
                                         releaseDate: movie.releaseDate,
                                         image: image)
        return model
    }

    private func makeIndex(from string: String) -> String {
        let components = string.components(separatedBy: "/")
        let index = components[components.count - 2]
        return index
    }

    private func prepareSpecs() {
        var count = 0
        guard let movie = movie else { return }

        if !movie.characters.isEmpty {
            count += 1
            titles.append(Constants.Entity.characters)
        }
        if !movie.planets.isEmpty {
            count += 1
            titles.append(Constants.Entity.planets)
        }
        if !movie.species.isEmpty {
            count += 1
            titles.append(Constants.Entity.species)
        }
        if !movie.starships.isEmpty {
            count += 1
            titles.append(Constants.Entity.starships)
        }
        if !movie.vehicles.isEmpty {
            count += 1
            titles.append(Constants.Entity.vehicles)
        }
        specs = Array(repeating: [EntityShortViewModel](), count: count)
    }

    func getLabelTitleFor(section: Int) -> String {
        return titles[section]
    }

}
