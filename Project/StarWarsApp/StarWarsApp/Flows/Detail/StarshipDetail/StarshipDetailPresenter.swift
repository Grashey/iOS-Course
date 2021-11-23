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
    var model: StarshipViewModel?
    var specs = [[EntityShortViewModel]]()
    private var titles = [String]()
    private let service = StarshipDetailNetworkService()

    func getData() {
        viewController?.isLoading = true
        prepareSpecs()
        model = makeModel()
        viewController?.tableView.reloadData()
        getFilms()
    }

    private func getFilms() {
        guard let element = specs.firstIndex(where: { $0.isEmpty }),
                let subIndex = specs.firstIndex(of: specs[element]),
                let entity = self.entity, !entity.films.isEmpty else {
                    getCharacter()
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
                            self.getCharacter()
                        }
                    case .failure(let error):
                        self.showAlert(message: error.message)
                    }
                }
            }
        }
    }

    private func getCharacter() {
        guard let element = specs.firstIndex(where: { $0.isEmpty }),
                let subIndex = specs.firstIndex(of: specs[element]),
                let entity = self.entity, !entity.pilots.isEmpty else {
                    viewController?.isLoading = false
                    return
                }

        let characterIndexes = entity.pilots.map { makeIndex(from: $0)}
        characterIndexes.forEach { index in
            self.service.fetchCharacter(index: index) { [weak self] result in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        let image = UIImage(named: Constants.ImageName.characters)
                        let character = EntityShortViewModel(name: data.name, image: image)
                        self.specs[subIndex].append(character)
                        if index == characterIndexes.last {
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

    private func makeModel() -> StarshipViewModel? {
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
                                      image: image)
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
        if !entity.pilots.isEmpty {
            count += 1
            titles.append(Constants.Entity.characters)
        }
        specs = Array(repeating: [EntityShortViewModel](), count: count)
    }

    func getLabelTitleFor(section: Int) -> String {
        return titles[section]
    }
}
