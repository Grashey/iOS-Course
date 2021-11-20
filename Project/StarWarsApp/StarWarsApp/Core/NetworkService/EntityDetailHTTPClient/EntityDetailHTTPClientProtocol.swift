//
//  EntityDetailHTTPClientProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 08.11.2021.
//

import Foundation

protocol EntityDetailHTTPClientProtocol {

    func request<ResponseType: Decodable>(for route: Route, index: String, completion: @escaping (Result<ResponseType, NetworkServiceError>) -> Void)
}
