//
//  VehicleNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.11.2021.
//

import Foundation

class VehicleNetworkService {

    let httpClient: HTTPClientProtocol

    init(httpClient: HTTPClientProtocol = HTTPClient()) {
        self.httpClient = httpClient
    }

    func fetchVehicles(pageIndex: Int, completion: @escaping (Result<VehicleResponse, NetworkServiceError>) -> Void) {
        httpClient.request(for: EntityRoute.vehicles, page: pageIndex, completion: completion)
    }
}
