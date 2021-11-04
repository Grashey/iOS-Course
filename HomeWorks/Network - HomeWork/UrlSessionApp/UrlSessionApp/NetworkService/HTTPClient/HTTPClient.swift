//
//  HTTPClient.swift
//  UrlSessionApp
//
//  Created by Aleksandr Fetisov on 01.11.2021.
//

import UIKit

class HTTPClient: HTTPClientProtocol {

    let session = URLSession(configuration: .default)
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    let decoder:JSONDecoder = {
        $0.keyDecodingStrategy = .convertFromSnakeCase
        return $0
    } (JSONDecoder())

    func request<ResponseType: Decodable>(for route: Route, completion: @escaping (Result<ResponseType, NetworkServiceError>) -> Void) {
        
        let handler: Handler = { rawData, response, error in
            do {
                let data = try self.httpResponse(data: rawData, response: response)
                let response = try self.decoder.decode(ResponseType.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error as? NetworkServiceError ?? .decodable))
            }
        }
        
        do {
            let request: URLRequest = try makeRequest(route: route)
            session.dataTask(with: request, completionHandler: handler).resume()
        } catch {
            completion(.failure(error as? NetworkServiceError ?? .unknown))
        }

    }
    
    private func httpResponse(data: Data?, response: URLResponse?) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkServiceError.response
        }
        if (400..<500).contains(httpResponse.statusCode) {
            throw NetworkServiceError.client
        }
        if (500..<600).contains(httpResponse.statusCode) {
            throw NetworkServiceError.server
        }
        guard (200..<300).contains(httpResponse.statusCode), let data = data else {
            throw NetworkServiceError.data
        }
        return data
    }
    
    private func makeRequest(route: Route) throws -> URLRequest {
        var components = URLComponents(string: route.makeURL())
        if !route.parameters.isEmpty {
            route.parameters.forEach { param in
                components?.queryItems?.append(URLQueryItem(name: param.key, value: param.value as? String))
            }
        }
        
        guard let url = components?.url else { throw NetworkServiceError.wrongUrl }
        var request = URLRequest(url: url)
        request.httpMethod = route.method
        return request
    }
}
