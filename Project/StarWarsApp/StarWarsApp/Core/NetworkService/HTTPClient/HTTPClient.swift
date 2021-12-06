//
//  HTTPClient.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.12.2021.
//

import Foundation

class HTTPClient: HTTPClientProtocol {

    let session = URLSession(configuration: .default)
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    let decoder: JSONDecoder = {
        $0.keyDecodingStrategy = .convertFromSnakeCase
        return $0
    }(JSONDecoder())

    func request<ResponseType: Decodable>(request: URLRequest, completion: @escaping (Result<ResponseType, NetworkServiceError>) -> Void) {

        let handler: Handler = { rawData, response, error in
            do {
                guard let data = rawData as? ResponseType else {
                    let data = try self.httpResponse(data: rawData, response: response)
                    let decoded = try self.decoder.decode(ResponseType.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(decoded))
                    }
                    return
                }
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error as? NetworkServiceError ?? .decodable))
                }
            }
        }
        self.session.dataTask(with: request, completionHandler: handler).resume()

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

}
