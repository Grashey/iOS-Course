//
//  EntityHTTPClient.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 04.11.2021.
//

import Foundation

class EntityHTTPClient: EntityHTTPClientProtocol {

    let session = URLSession(configuration: .default)
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    let decoder:JSONDecoder = {
        $0.keyDecodingStrategy = .convertFromSnakeCase
        return $0
    } (JSONDecoder())

    func request<ResponseType: Decodable>(for route: Route, page: Int?, completion: @escaping (Result<ResponseType, NetworkServiceError>) -> Void) {
        
        let handler: Handler = { rawData, response, error in
            do {
                let data = try self.httpResponse(data: rawData, response: response)
                let decoded = try self.decoder.decode(ResponseType.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error as? NetworkServiceError ?? .decodable))
            }
        }
        
        do {
            let request: URLRequest = try makeRequest(route: route, page: page)
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
    
    private func makeRequest(route: Route, page: Int?) throws -> URLRequest {
        var components = URLComponents(string: route.makeURL())
        if let page = page {
            route.parameters.forEach {
                components?.queryItems = [URLQueryItem(name: $0.key, value: String(page))]
            }
        }
        
        guard let url = components?.url else { throw NetworkServiceError.wrongUrl }
        var request = URLRequest(url: url)
        request.httpMethod = route.method
        return request
    }
}
