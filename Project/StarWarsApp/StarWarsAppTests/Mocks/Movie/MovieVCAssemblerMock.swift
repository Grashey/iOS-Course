//
//  MovieVCAssemblerMock.swift
//  StarWarsAppTests
//
//  Created by Aleksandr Fetisov on 27.11.2021.
//

@testable import StarWarsApp
import UIKit

class MovieVCAssemblerMock: ViewControllerAssemblerProtocol {

    var createWasCalled = false

    func create() -> UIViewController {
        createWasCalled = true
        return UIViewController()
    }
}
