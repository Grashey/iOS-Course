//
//  DIContainer.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 26.11.2021.
//

import Foundation

class Container {
    static let shared = Container()
    private init() {}

    lazy var coreDataStack = CoreDataStack(modelName: "CoreDataModel")
}
