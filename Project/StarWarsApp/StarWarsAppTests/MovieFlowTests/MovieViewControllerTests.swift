//
//  MovieViewControllerTests.swift
//  StarWarsAppTests
//
//  Created by Aleksandr Fetisov on 01.12.2021.
//

import XCTest
@testable import StarWarsApp

class MovieViewControllerTests: XCTestCase {

    var presenterMock: MoviePresenterMock!
    var viewController: MovieViewController!

    override func setUpWithError() throws {
        presenterMock = .init()
        viewController = MovieViewController()
        viewController.presenter = presenterMock
    }

    override func tearDownWithError() throws {
        presenterMock = nil
        viewController = nil
    }

    func testThatGetDataCalls() {
        // arrange
        presenterMock.getDataWasCalled = false

        // act
        viewController.viewDidLoad()

        // assert
        XCTAssertTrue(presenterMock.getDataWasCalled)
    }

}
