//
//  MoviePresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.10.2021.
//

import UIKit

class MoviePresenter: MoviePresenterProtocol {

    weak var viewController: MovieViewController?

    private let service = MovieNetworkService()
    var movies: [MovieData] = []
    var viewModels: [MovieViewModel] = []

    func getData() {
        viewController?.isLoading = true
        getMovies()
    }

    private func getMovies() {
        service.fetchMovies { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.movies = data.results.sorted { $0.episodeId < $1.episodeId }
                    self.mapViewModel()
                    self.viewController?.reloadTable()

                    for index in self.viewModels.indices {
                        self.getImage(for: index)
                    }
                case .failure(let error):
                    self.showAlert(message: error.message)
                }
                self.viewController?.isLoading = false
            }
        }
    }

    private func getImage(for index: Int) {
        self.service.fetchImage(for: index) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.movies[index].imageData = data
                self.viewModels[index].image = UIImage(data: data)

                let keeper = MoviePosterKeeper()
                keeper.savePoster(for: self.viewModels[index])

                DispatchQueue.main.async {
                    self.viewController?.reloadCell(index: index)
                }
            case .failure(let error):
                self.showAlert(message: error.message)
            }
        }
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: Constants.AlertTitle.message,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.AlertTitle.okey, style: .default, handler: nil))
        viewController?.present(alert, animated: true)
    }

    private func mapViewModel() {
        // TODO: сделать красивую заглушку (анимированную?) для постера
        guard let image = UIImage(named: Constants.ImageName.backgroundImage) else { return }
        self.viewModels = self.movies.map { MovieViewModel(title: $0.title, episodeNumber: $0.episodeId, image: image)}
    }

}
