//
//  MoviePresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.10.2021.
//

import Foundation
import UIKit

private enum ViewModel {
    case short
    case long
}

class MoviePresenter: MoviePresenterProtocol {
 
    weak var viewController: MovieViewController?
    
    private let service = MoviesNetworkService()
    private var movies: [GetMoviesDataResponse] = []
    var viewModels: [MovieViewModel] = []
    var shortViewModels: [MovieShortViewModel] = []
    
    private var isLoading = false {
        didSet {
            guard oldValue != isLoading else { return }
            viewController?.showSpinner(isShown: isLoading)
        }
    }
    
    func getData() {
        isLoading = true
        service.fetchMovies { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.movies = data.results.sorted { $0.episodeId < $1.episodeId }
                self.mapViewModel(model: .short)
                
                DispatchQueue.main.async {
                    self.viewController?.reloadTable()
                    self.isLoading = false
                }
                
                DispatchQueue.global(qos: .background).async {
                    self.mapViewModel(model: .long)
                }
                
                for (index, _) in self.shortViewModels.enumerated() {
                    self.getImage(for: index)
                }
            case .failure(let error):
                self.showAlert(message: error.message)
            }
        }
    }
    
    private func getImage(for index: Int) {
        self.service.fetchImage(for: index) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.shortViewModels[index].image = UIImage(data: data)
                self.viewModels[index].image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.viewController?.reloadCell(index: index)
                }
            case .failure(let error):
                self.showAlert(message: error.message)
            }
        }
    }
    
    private func showAlert(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Опаньки, что-то пошло не так!",
                                          message: message,
                                          preferredStyle: .alert)
            self.viewController?.present(alert, animated: true)
        }
    }
    
    private func mapViewModel(model: ViewModel) {
        let image = UIImage(named: "backgroundLayer")
        guard let image = image else { return }
        switch model {
        case .short:
            self.shortViewModels = self.movies.map { MovieShortViewModel(title: $0.title, episodeNumber: $0.episodeId, image: image)}
        case .long:
            self.viewModels = self.movies.map { MovieViewModel(title: $0.title, episodeNumber: $0.episodeId, annotation: $0.openingCrawl, director: $0.director, producer: $0.producer, releaseDate: $0.releaseDate, characters: $0.characters, planets: $0.planets, species: $0.species, starships: $0.starships, vehicles: $0.vehicles, image: image)
            }
        }
    }
    
}
