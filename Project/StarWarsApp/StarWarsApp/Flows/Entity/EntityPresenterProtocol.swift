//
//  EntityPresenterProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 20.10.2021.
//

import Foundation

protocol EntityPresenterProtocol {
    
    var viewModel: [EntityShortViewModel] { get set }
    var entity: EntityRoute { get set }

    func getData()
    func getTitleName() -> String
}
