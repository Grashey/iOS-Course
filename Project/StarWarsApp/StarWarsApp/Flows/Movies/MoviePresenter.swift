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
                self.mapViewModel()
                
                DispatchQueue.main.async {
                    self.viewController?.reloadTable()
                    self.isLoading = false
                }
                
                for (index, _) in self.viewModels.enumerated() {
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
    
    private func mapViewModel() {
        //TODO: сделать красивую заглушку (анимированную?) для постера
        let image = UIImage(named: Constants.ImageName.backgroundImage)
        guard let image = image else { return }
        self.viewModels = self.movies.map { MovieViewModel(title: $0.title, episodeNumber: $0.episodeId, image: image)}
    }
    
}
