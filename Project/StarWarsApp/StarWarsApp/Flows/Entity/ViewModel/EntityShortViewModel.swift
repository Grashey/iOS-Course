//
//  EntityShortViewModel.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 20.10.2021.
//

import Foundation

struct EntityShortViewModel {
    
    let undefined = "undefined"
    
    let entityViewModel: EntityShortViewModelProtocol?
    
    init(entityViewModel: EntityShortViewModelProtocol) {
        self.entityViewModel = entityViewModel
    }
    
    var name: String {
        return entityViewModel?.name ?? undefined
    }
}
