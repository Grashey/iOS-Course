//
//  MovieDetailPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 24.10.2021.
//

import Foundation

protocol MovieDetailPresenterProtocol {

    var model: MovieDetailViewModel? {get}
    var movie: MovieData? {get set}
    var specs: [[EntityShortViewModel]] {get}

    func getData()
    func getLabelTitleFor(section: Int) -> String
}
