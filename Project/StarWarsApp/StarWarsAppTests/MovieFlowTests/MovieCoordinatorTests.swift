//
//  MovieCoordinatorTests.swift
//  StarWarsAppTests
//
//  Created by Aleksandr Fetisov on 01.12.2021.
//

import XCTest
@testable import StarWarsApp

class MovieCoordinatorTests: XCTestCase {

    var coordinator: MovieCoordinator!
    var assemblerMock: MovieVCAssemblerMock!
    var viewControllerMock: MovieViewControllerMock!

    override func setUpWithError() throws {
        viewControllerMock = .init()
        assemblerMock = .init()
        coordinator = MovieCoordinator(navigationController: UINavigationController(), vcAssembler: assemblerMock)
    }

    override func tearDownWithError() throws {
        viewControllerMock = nil
        assemblerMock = nil
        coordinator = nil
    }

    func testThatAssemblerCreateCalls() {
        // arrange
        assemblerMock.createWasCalled = false

        // act
        coordinator.start()

        // assert
        XCTAssertTrue(assemblerMock.createWasCalled)
    }

}
