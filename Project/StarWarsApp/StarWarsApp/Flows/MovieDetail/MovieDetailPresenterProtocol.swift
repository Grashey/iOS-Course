//
//  MovieDetailPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 24.10.2021.
//

import Foundation

protocol MovieDetailPresenterProtocol {
    
    var model: MovieDetailViewModel? {get set}
    var movie: MovieData? {get set}
    
    func makeModel() -> MovieDetailViewModel?
}
