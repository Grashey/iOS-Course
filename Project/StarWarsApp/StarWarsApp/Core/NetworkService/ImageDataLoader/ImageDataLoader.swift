//
//  ImageDataLoader.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

class ImageDataLoader: ImageDataLoaderProtocol {
    
    let session = URLSession(configuration: .default)
    typealias Handler = (Data?, URLResponse?, Error?) -> Void

    func request(for route: Route, completion: @escaping (Result<Data, NetworkServiceError>) -> Void) {
        let components = URLComponents(string: route.makeURL())
        guard let url = components?.url else { return completion(.failure(.wrongUrl)) }
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy)
        request.httpMethod = route.method
        
        let handler: Handler = { rawData, _, error in
            guard let data = rawData else { return completion(.failure(.data)) }
            completion(.success(data))
        }
        session.dataTask(with: request, completionHandler: handler).resume()
    }
}
