//
//  HTTPClientProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.12.2021.
//

import Foundation

protocol HTTPClientProtocol {

    func request<ResponseType: Decodable>(request: URLRequest, completion: @escaping (Result<ResponseType, NetworkServiceError>) -> Void)
}
