//
//  VehicleDetailPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 29.10.2021.
//

import UIKit

class VehicleDetailPresenter: VehicleDetailPresenterProtocol {

    weak var viewController: VehicleDetailViewController?

    var entity: VehicleData?
    var model: VehicleViewModel?
    var specs = [[EntityShortViewModel]]()
    private var titles = [String]()
    private let service = VehicleDetailNetworkService()
    private let coreDataStack = Container.shared.coreDataStack
    var isSaved = false {
        didSet {
            guard oldValue != isSaved else { return }
            viewController?.switchRightBarButtonItemTitle()
        }
    }

    func getData() {
        if let entity = self.entity {
            isSaved = coreDataStack.check(name: entity.name)
        }
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

    private func makeModel() -> VehicleViewModel? {
        guard let image = UIImage(named: Constants.ImageName.vehicles), let entity = entity else { return nil }
        let model = VehicleViewModel(name: entity.name,
                                     model: entity.model,
                                     vehicleClass: entity.vehicleClass,
                                     manufacturer: entity.manufacturer,
                                     costInCredits: entity.costInCredits,
                                     length: entity.length,
                                     crew: entity.crew,
                                     passengers: entity.passengers,
                                     maxAtmospheringSpeed: entity.maxAtmospheringSpeed,
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

    func operateFavorites() {
        guard let model = model else { return }
        if !isSaved {
            guard let imageData = model.image?.pngData() else { return }
            coreDataStack.addEntity(name: model.name, type: Constants.Entity.vehicles, imageData: imageData)
            isSaved = true
        } else {
            coreDataStack.delete(name: model.name)
            isSaved = false
        }
    }
}
