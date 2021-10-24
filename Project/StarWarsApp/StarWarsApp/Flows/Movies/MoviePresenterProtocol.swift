//
//  MoviePresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.10.2021.
//

import Foundation

protocol MoviePresenterProtocol {
    
    var viewModel: [MovieViewModel]? { get set }

    func getData()
}
