//
//  MoviePresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.10.2021.
//

import UIKit

class MoviePresenter: MoviePresenterProtocol {

    weak var viewController: MovieViewControllerProtocol?

    private let networkService: MovieNetworkServiceProtocol
    private let keeper: ImageKeeperProtocol
    var movies: [MovieData] = []
    var viewModels: [MovieViewModel] = []

    init(networkService: MovieNetworkServiceProtocol, imageKeeper: ImageKeeperProtocol) {
        self.networkService = networkService
        self.keeper = imageKeeper
    }

    func getData() {
        viewController?.isLoading = true
        getMovies()
    }

    private func getMovies() {
        networkService.fetchMovies { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.movies = data.results.sorted { $0.episodeId < $1.episodeId }
                self.mapViewModel()
                self.viewController?.reloadTable()

                for index in self.viewModels.indices {
                    self.getImage(for: index)
                }
            case .failure(let error):
                self.viewController?.showAlert(message: error.message)
            }
            self.viewController?.isLoading = false
        }
    }

    private func getImage(for index: Int) {
        self.networkService.fetchImage(for: index) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.movies[index].imageData = data
                self.viewModels[index].image = UIImage(data: data)
                self.viewController?.reloadCell(index: index)
                self.keeper.saveImage(for: self.viewModels[index])
            case .failure(let error):
                self.viewController?.showAlert(message: error.message)
            }
        }
    }

    private func mapViewModel() {
        guard let image = UIImage(named: Constants.ImageName.backgroundImage) else { return }
        self.viewModels = self.movies.map { MovieViewModel(title: $0.title, episodeNumber: $0.episodeId, image: image)}
    }

}
