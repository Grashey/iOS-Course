//
//  ImageLoaderProtocol.swift
//  UrlSessionApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

protocol ImageLoaderProtocol {
    
    func request(for route: Route, completion: @escaping (Result<Data, NetworkServiceError>) -> Void)
}
