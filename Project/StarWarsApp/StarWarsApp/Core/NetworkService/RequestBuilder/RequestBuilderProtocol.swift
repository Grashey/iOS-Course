//
//  RequestBuilderProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.12.2021.
//

import Foundation

protocol RequestBuilderProtocol {

    func makeRequest(route: Route, index: String?, page: Int?) -> URLRequest

}
