//
//  FavoritesPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 24.11.2021.
//

import Foundation

protocol FavoritesPresenterProtocol {

    var viewModel: [EntityShortViewModel] {get}

    func getData()
    func makeEntity(name: String) -> TransferDataProtocol?
}
