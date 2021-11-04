//
//  MoviePresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.10.2021.
//

import UIKit

protocol MoviePresenterProtocol {
    
    var shortViewModels: [MovieShortViewModel] { get set }
    var viewModels: [MovieViewModel] { get set }

    func getData()
}
