//
//  EntityHTTPClientProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

protocol EntityHTTPClientProtocol {
    
    func request<ResponseType: Decodable>(for route: Route, page: Int?, completion: @escaping (Result<ResponseType, NetworkServiceError>) -> Void)
}
