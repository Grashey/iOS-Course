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
    var model: PlanetViewModel?
    var specs = [[EntityShortViewModel]]()
    private var titles = [String]()
    private let service = PlanetDetailNetworkService()
    private let dataService: DataKeeperProtocol
    var isSaved = false {
        didSet {
            guard oldValue != isSaved else { return }
            viewController?.switchRightBarButtonItemImage()
        }
    }

    init(dataService: DataKeeperProtocol = Container.shared.coreDataStack) {
        self.dataService = dataService
    }

    func getData() {
        checkIsFavorite()
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
                let entity = self.entity, !entity.residents.isEmpty else {
                    viewController?.isLoading = false
                    return
                }

        let characterIndexes = entity.residents.map { makeIndex(from: $0)}
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

    private func makeModel() -> PlanetViewModel? {
        guard let image = UIImage(named: Constants.ImageName.planets), let entity = entity else { return nil }
        let model = PlanetViewModel(name: entity.name,
                                    diameter: entity.diameter,
                                    rotationPeriod: entity.rotationPeriod,
                                    orbitalPeriod: entity.orbitalPeriod,
                                    gravity: entity.gravity,
                                    population: entity.population,
                                    climate: entity.climate,
                                    terrain: entity.climate,
                                    waterSurface: entity.surfaceWater,
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
        if !entity.residents.isEmpty {
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
            dataService.addEntity(name: model.name, type: Constants.Entity.planets, imageData: imageData)
            isSaved = true
        } else {
            dataService.delete(name: model.name)
            isSaved = false
        }
    }

    func checkIsFavorite() {
        if let entity = self.entity {
            isSaved = dataService.check(name: entity.name)
        }
    }
}
