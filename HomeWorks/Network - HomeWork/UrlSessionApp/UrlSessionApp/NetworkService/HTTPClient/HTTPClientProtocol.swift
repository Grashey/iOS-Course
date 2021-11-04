//
//  HTTPClientProtocol.swift
//  UrlSessionApp
//
//  Created by Aleksandr Fetisov on 01.11.2021.
//

import Foundation

protocol HTTPClientProtocol {
    
    func request<ResponseType: Decodable>(for route: Route, completion: @escaping (Result<ResponseType, NetworkServiceError>) -> Void)
}
