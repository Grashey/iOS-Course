//
//  MovieDetailViewControllerTests.swift
//  StarWarsAppTests
//
//  Created by Aleksandr Fetisov on 02.12.2021.
//

import XCTest
@testable import StarWarsApp

class MovieDetailViewControllerTests: XCTestCase {

    var presenterMock: MovieDetailPresenterMock!
    var viewController: MovieDetailViewController!

    override func setUpWithError() throws {
        presenterMock = .init()
        viewController = MovieDetailViewController()
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

    func testThatGetTitleForCalls() {
        // arrange
        let tableView = viewController.tableView
        let section = 1

        // act
        viewController.tableView(tableView, viewForHeaderInSection: section)

        // assert
        XCTAssertTrue(presenterMock.getLabelTitleForWasCalled)
    }

}
