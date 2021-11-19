//
//  VehicleNetworkService.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.11.2021.
//

import Foundation

class VehicleNetworkService {

    private let httpClient: EntityHTTPClientProtocol

    init(httpClient: EntityHTTPClientProtocol = EntityHTTPClient()) {
        self.httpClient = httpClient
    }

    func fetchVehicles(pageIndex: Int, completion: @escaping (Result<VehicleResponse, NetworkServiceError>) -> Void) {
        httpClient.request(for: EntityRoute.vehicles, page: pageIndex, completion: completion)
    }
}
