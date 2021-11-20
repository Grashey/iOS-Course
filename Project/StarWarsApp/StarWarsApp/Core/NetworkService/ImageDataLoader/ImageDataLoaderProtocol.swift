//
//  ImageDataLoaderProtocol.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

protocol ImageDataLoaderProtocol {

    func request(for route: Route, completion: @escaping (Result<Data, NetworkServiceError>) -> Void)
}
