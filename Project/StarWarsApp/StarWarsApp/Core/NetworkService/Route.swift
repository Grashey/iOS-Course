//
//  Route.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

protocol Route {

    var method: String { get }

    var url: String { get }

    var baseURL: String { get }

    var parameters: [String: Int] { get }

    func makeURL() -> String
}

extension Route {

    var method: String { "GET" }

    var parameters: [String: Int] { [:] }

    func makeURL() -> String {
       baseURL.appending(url)
    }

}
