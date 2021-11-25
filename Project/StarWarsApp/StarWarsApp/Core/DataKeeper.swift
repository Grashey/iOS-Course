//
//  DataKeeper.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 24.11.2021.
//

import Foundation

class DataKeeper {

    private let defaults = UserDefaults.standard

    func load() -> [String] {
        if let decoded = self.defaults.data(forKey: "favorites"),
           let models = try? JSONDecoder().decode([String].self, from: decoded) {
            return models
        }
       return [String]()
    }

    func save(model: String) {
        var array = load()
        array.append(model)
        if let encoded = try? JSONEncoder().encode(array) {
            self.defaults.set(encoded, forKey: "favorites")

        }
    }

    func remove(model: String) {
        var array = load()
        if let index = array.firstIndex(of: model) {
            array.remove(at: index)
            if let encoded = try? JSONEncoder().encode(array) {
                self.defaults.set(encoded, forKey: "favorites")
            }
        }
    }

}
