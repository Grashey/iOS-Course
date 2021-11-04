//
//  Route.swift
//  UrlSessionApp
//
//  Created by Aleksandr Fetisov on 01.11.2021.
//

import Foundation

protocol Route  {

    var method: String { get }

    var url: String { get }

    var baseURL: String { get }

    var parameters: [String: Any] { get }

    func makeURL() -> String
}

extension Route {

    var method: String { "GET" }

    var parameters: [String: Any] { [:] }

    func makeURL() -> String {
       baseURL.appending(url)
    }
}
