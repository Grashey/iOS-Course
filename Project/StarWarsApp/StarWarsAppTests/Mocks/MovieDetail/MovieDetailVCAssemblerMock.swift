//
//  MovieDetailVCAssemblerMock.swift
//  StarWarsAppTests
//
//  Created by Aleksandr Fetisov on 01.12.2021.
//

import UIKit
@testable import StarWarsApp

class MovieDetailVCAssemblerMock: ViewControllerAssemblerProtocol {

    var createWasCalled = false

    func create() -> UIViewController {
        createWasCalled = true
        return UIViewController()
    }
}
