//
//  MovieDetailPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 24.10.2021.
//

import UIKit

class MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    weak var viewController: MovieDetailViewController?
    
    var model: MovieDetailViewModel?
    var movie: MovieData?
    
    func makeModel() -> MovieDetailViewModel? {
        if let movie = movie, let data = movie.imageData, let image = UIImage(data: data) {
        model = MovieDetailViewModel(title: movie.title, episodeNumber: movie.episodeId, annotation: movie.openingCrawl, director: movie.director, producer: movie.producer, releaseDate: movie.releaseDate, characters: movie.characters, planets: movie.planets, species: movie.species, starships: movie.starships, vehicles: movie.vehicles, image: image)
        }
        return model
    }
}
