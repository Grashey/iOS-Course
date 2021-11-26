//
//  DataKeeperProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 24.11.2021.
//

import Foundation

protocol DataKeeperProtocol {

    func check(name: String) -> Bool
    func deleteAll()
    func delete(name: String)
    func addEntity(name: String, type: String, imageData: Data)

}
