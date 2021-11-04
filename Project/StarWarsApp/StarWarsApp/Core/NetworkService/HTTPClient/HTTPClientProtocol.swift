//
//  HTTPClientProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

protocol HTTPClientProtocol {
    
    func request<ResponseType: Decodable>(for route: Route, completion: @escaping (Result<ResponseType, NetworkServiceError>) -> Void)
}
