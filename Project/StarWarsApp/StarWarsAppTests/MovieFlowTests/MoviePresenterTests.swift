//
//  MoviePresenterTests.swift
//  MoviePresenterTests
//
//  Created by Aleksandr Fetisov on 22.11.2021.
//

import XCTest
@testable import StarWarsApp

class MoviePresenterTests: XCTestCase {

    var presenter: MoviePresenter!
    var viewControllerMock: MovieViewControllerMock!
    var serviceMock: MovieNetworkServiceMock!
    var imageKeeper: ImageKeeperMock!

    override func setUpWithError() throws {
        serviceMock = .init()
        imageKeeper = .init()
        presenter = MoviePresenter(networkService: serviceMock, imageKeeper: imageKeeper)
        viewControllerMock = .init()
        presenter.viewController = viewControllerMock
    }

    override func tearDownWithError() throws {
        serviceMock = nil
        viewControllerMock = nil
        presenter = nil
    }

    func testThatGetDataSetIsLoadingTrue() {
        // arrange
        viewControllerMock.isLoading = false

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(viewControllerMock.stubbedIsLoading)
    }

    func testThatGetDataSetIsLoadingFalseAfterCompletionSuccess() {
        // arrange
        viewControllerMock.isLoading = true
        serviceMock.stubbedFetchMoviesCompletionResult = .success(Success.movieResponseData)
        presenter.viewModels = Success.viewModels
        serviceMock.stubbedFetchImageCompletionResult = .success(Success.imageData)

        // act
        presenter.getData()

        // assert
        XCTAssertFalse(viewControllerMock.stubbedIsLoading)
    }

    func testThatGetDataSetIsLoadingFalseAfterCompletionFailure() {
        // arrange
        viewControllerMock.isLoading = true
        serviceMock.stubbedFetchMoviesCompletionResult = .failure(Failure.error)

        // act
        presenter.getData()

        // assert
        XCTAssertFalse(viewControllerMock.stubbedIsLoading)
    }

    func testThatGetDataCallsFetchMovies() {
        // arrange
        serviceMock.invokedFetchMovies = false

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(serviceMock.invokedFetchMovies)
    }

    func testThatFetchImageCalledWhenGetMoviesCompetionIsSuccess() {
        // arrange
        serviceMock.stubbedFetchMoviesCompletionResult = .success(Success.movieResponseData)
        presenter.viewModels = Success.viewModels
        serviceMock.invokedFetchImage = false

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(serviceMock.invokedFetchImage)
    }

    func testThatGetDataCallsViewControllerReloadTable() {
        // arrange
        serviceMock.stubbedFetchMoviesCompletionResult = .success(Success.movieResponseData)

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(viewControllerMock.reloadTableWasCalled)
    }

    func testThatGetDataCallsViewControllerReloadCell() {
        // arrange
        serviceMock.stubbedFetchMoviesCompletionResult = .success(Success.movieResponseData)
        presenter.viewModels = Success.viewModels
        serviceMock.stubbedFetchImageCompletionResult = .success(Success.imageData)

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(viewControllerMock.reloadCellWasCalled)
    }

    func testThatGetDataCallShowErrorAlertIfFetchMoviesFailure() {
        // arrange
        serviceMock.stubbedFetchMoviesCompletionResult = .failure(Failure.error)

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(viewControllerMock.showAlertWasCalled)
    }

    func testThatGetDataCallShowErrorAlertIfFetchImageFailure() {
        // arrange
        serviceMock.stubbedFetchMoviesCompletionResult = .success(Success.movieResponseData)
        presenter.viewModels = Success.viewModels
        serviceMock.stubbedFetchImageCompletionResult = .failure(Failure.error)

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(viewControllerMock.showAlertWasCalled)
    }

    func testThatGetDataCallsImageKeeperToSaveFetchedImage() {
        // arrange
        serviceMock.stubbedFetchMoviesCompletionResult = .success(Success.movieResponseData)
        presenter.viewModels = Success.viewModels
        serviceMock.stubbedFetchImageCompletionResult = .success(Success.imageData)

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(imageKeeper.saveImageWasCalled)
    }
}

private extension MoviePresenterTests {

    enum Success {
        private static let movieData = MovieData(episodeId: 1, title: "Title", openingCrawl: "openingCrawl",
                                                 director: "director", producer: "producer", releaseDate: "releaseDate",
                                                 characters: ["characters"], planets: ["planets"],
                                                 starships: ["starships"], vehicles: ["vehicles"], species: ["species"],
                                                 url: "url", imageData: nil)
        static let movieResponseData = MovieResponse.init(count: 1, next: nil, previous: nil, results: [movieData])
        static let imageData = Data()
        static let viewModels = [MovieViewModel(title: "Title", episodeNumber: 1, image: nil)]
    }

    enum Failure {
        static let error = NetworkServiceError.unknown
    }
}
