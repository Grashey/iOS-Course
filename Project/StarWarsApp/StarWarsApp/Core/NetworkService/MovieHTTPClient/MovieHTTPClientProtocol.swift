//
//  MovieHTTPClientProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 08.11.2021.
//

import Foundation

protocol MovieHTTPClientProtocol {

    func request<ResponseType: Decodable>(for route: Route, completion: @escaping (Result<ResponseType, NetworkServiceError>) -> Void)
}
