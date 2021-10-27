//
//  MovieDetailPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 24.10.2021.
//

import Foundation

class MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    weak var viewController: MovieDetailViewController?
    
    var model: MovieViewModel?
}
