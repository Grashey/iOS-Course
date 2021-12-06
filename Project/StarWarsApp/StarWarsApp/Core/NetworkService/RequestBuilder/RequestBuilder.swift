//
//  RequestBuilder.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.12.2021.
//

import Foundation

class RequestBuilder: RequestBuilderProtocol {

    func makeRequest(route: Route, index: String?, page: Int?) -> URLRequest {

        var components = URLComponents(string: route.makeURL().appending(index ?? ""))

        if let page = page {
            route.parameters.forEach {
                components?.queryItems = [URLQueryItem(name: $0.key, value: String(page))]
            }
        }

        if let url = components?.url {
            var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy)
            request.httpMethod = route.method
            return request
        }
        return URLRequest(url: URL(fileURLWithPath: ""))
    }

}
