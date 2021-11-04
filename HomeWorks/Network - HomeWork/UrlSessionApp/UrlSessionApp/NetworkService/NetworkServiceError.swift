//
//  NetworkServiceError.swift
//  UrlSessionApp
//
//  Created by Aleksandr Fetisov on 01.11.2021.
//

enum NetworkServiceError: Error {
    case client
    case server
    case response
    case data
    case wrongUrl
    case decodable
    case unknown

    var message: String {
        switch self {
        case .client:
            return "Ошибка клиента"
        case .server:
            return "Ошибка сервера"
        case .response:
            return "Ответ от сервера не получен"
        case .data:
            return "Ошибка данных"
        case .wrongUrl:
            return "Неправильный запрос"
        case .decodable:
            return "Не смогли распарсить"
        case .unknown:
            return "?????"
        }
    }
}
