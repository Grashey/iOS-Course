//
//  MovieDetailPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 24.10.2021.
//

import UIKit

protocol MovieDetailPresenterProtocol {

    var model: MovieDetailViewModel? {get}
    var movie: MovieData? {get set}
    var specs: [[EntityShortViewModel]] {get}

    func getData()
    func makeLabelFor(section: Int) -> UILabel
}
