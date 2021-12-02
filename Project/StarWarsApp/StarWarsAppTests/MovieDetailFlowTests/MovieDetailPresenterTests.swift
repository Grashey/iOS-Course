//
//  MovieDetailPresenterTests.swift
//  StarWarsAppTests
//
//  Created by Aleksandr Fetisov on 01.12.2021.
//

import XCTest
@testable import StarWarsApp

class MovieDetailPresenterTests: XCTestCase {

    var presenter: MovieDetailPresenter!
    var viewControllerMock: MovieDetailViewControllerMock!
    var serviceMock: MovieDetailNetworkServiceMock!

    override func setUpWithError() throws {
        serviceMock = .init()
        presenter = MovieDetailPresenter(networkService: serviceMock)
        viewControllerMock = .init()
        presenter.viewController = viewControllerMock
    }

    override func tearDownWithError() throws {
        serviceMock = nil
        viewControllerMock = nil
        presenter = nil
    }

    // MARK: IsLoadingTests
    func testThatGetDataSetIsLoadingTrue() {
        // arrange
        presenter.specs = Success.specsPrepared
        presenter.movie = Success.movieDataWithoutSpecies

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(viewControllerMock.stubbedIsLoading)
    }

    func testThatIsLoadingFalseIfGetVehicleWithoutVehicle() {
        // arrange
        presenter.specs = Success.specsPrepared
        presenter.movie = Success.movieDataWithoutVehicle

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(viewControllerMock.invokedIsLoadingSetter)
        XCTAssertFalse(viewControllerMock.stubbedIsLoading)
    }

    func testThatIsLoadingFalseIfGetVehicleSuccess() {
        // arrange
        presenter.specs = Success.specsPrepared
        presenter.movie = Success.movieDataWithoutStarship
        serviceMock.stubbedFetchVehicleCompletionResult = .success(Success.vehicleData)

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(viewControllerMock.invokedIsLoadingSetter)
        XCTAssertFalse(viewControllerMock.stubbedIsLoading)
    }

    func testThatIsLoadingFalseIfGetVehicleFailure() {
        // arrange
        presenter.specs = Success.specsPrepared
        presenter.movie = Success.movieDataWithoutStarship
        serviceMock.stubbedFetchVehicleCompletionResult = .failure(Failure.error)

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(viewControllerMock.invokedIsLoadingSetter)
        XCTAssertFalse(viewControllerMock.stubbedIsLoading)
    }

    // MARK: ReloadTests
    func testThatGetDataCallsReloadTable() {
        // arrange
        viewControllerMock.reloadTableWasCalled = false

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(viewControllerMock.reloadTableWasCalled)
    }

    func testThatReloadCellCalledWhenGetCharacterCompetionIsSuccess() {
        // arrange
        presenter.specs = Success.specsPrepared
        presenter.movie = Success.movieData
        serviceMock.stubbedFetchCharacterCompletionResult = .success(Success.characterData)
        viewControllerMock.reloadCellWasCalled = false

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(viewControllerMock.reloadCellWasCalled)
    }

    // MARK: SuccessCallsTests
    func testThatGetDataCallsGetCharacter() {
        // arrange
        presenter.specs = Success.specsPrepared
        presenter.movie = Success.movieData
        serviceMock.invokedFetchCharacter = false

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(serviceMock.invokedFetchCharacter)
    }

    func testThatGetPlanetCalledWhenGetCharacterCompetionIsSuccess() {
        // arrange
        presenter.specs = Success.specsPrepared
        presenter.movie = Success.movieData
        serviceMock.stubbedFetchCharacterCompletionResult = .success(Success.characterData)
        serviceMock.invokedFetchPlanet = false

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(serviceMock.invokedFetchPlanet)
    }

    func testThatGetSpeciesCalledWhenGetPlanetCompetionIsSuccess() {
        // arrange
        presenter.specs = Success.specsPrepared
        presenter.movie = Success.movieDataWithoutCharacter // skip fetchCharacter
        serviceMock.stubbedFetchPlanetCompletionResult = .success(Success.planetData)
        serviceMock.invokedFetchSpecies = false

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(serviceMock.invokedFetchSpecies)
    }

    func testThatGetStarshipCalledWhenGetSpeciesCompetionIsSuccess() {
        // arrange
        presenter.specs = Success.specsPrepared
        presenter.movie = Success.movieDataWithoutPlanet // skip fetchCharacter & fetchPlanet
        serviceMock.stubbedFetchSpeciesCompletionResult = .success(Success.speciesData)
        serviceMock.invokedFetchStarship = false

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(serviceMock.invokedFetchStarship)
    }

    func testThatGetVehicleCalledWhenGetStarshipCompetionIsSuccess() {
        // arrange
        presenter.specs = Success.specsPrepared
        presenter.movie = Success.movieDataWithoutSpecies // skip fetchCharacter, fetchPlanet, fetchSpecies
        serviceMock.stubbedFetchStarshipCompletionResult = .success(Success.starshipData)
        serviceMock.invokedFetchVehicle = false

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(serviceMock.invokedFetchVehicle)
    }

    // MARK: ThrowToNextTests
    func testThatGetCharacterWithoutCharactersThrowsToGetPlanet() {
        // arrange
        presenter.specs = Success.specsPrepared
        presenter.movie = Success.movieDataWithoutCharacter
        serviceMock.stubbedFetchCharacterCompletionResult = .success(Success.characterData)
        serviceMock.invokedFetchPlanet = false

        // act
        presenter.getData()

        // assert
        XCTAssertFalse(serviceMock.invokedFetchCharacter)
        XCTAssertTrue(serviceMock.invokedFetchPlanet)
    }

    func testThatGetPlanetWithoutPlanetsThrowsToGetSpecies() {
        // arrange
        presenter.specs = Success.specsPrepared
        presenter.movie = Success.movieDataWithoutPlanet // skip fetchCharacter
        serviceMock.stubbedFetchSpeciesCompletionResult = .success(Success.speciesData)
        serviceMock.invokedFetchSpecies = false

        // act
        presenter.getData()

        // assert
        XCTAssertFalse(serviceMock.invokedFetchPlanet)
        XCTAssertTrue(serviceMock.invokedFetchSpecies)
    }

    func testThatGetSpeciesWithoutSpeciesThrowsToGetStarship() {
        // arrange
        presenter.specs = Success.specsPrepared
        presenter.movie = Success.movieDataWithoutSpecies // skip fetchCharacter, fetchPlanet
        serviceMock.stubbedFetchStarshipCompletionResult = .success(Success.starshipData)
        serviceMock.invokedFetchStarship = false

        // act
        presenter.getData()

        // assert
        XCTAssertFalse(serviceMock.invokedFetchSpecies)
        XCTAssertTrue(serviceMock.invokedFetchStarship)
    }

    func testThatGetStarshipWithoutStarshipThrowsToGetVehicle() {
        // arrange
        presenter.specs = Success.specsPrepared
        presenter.movie = Success.movieDataWithoutStarship // skip fetchCharacter, fetchPlanet, fetchSpecies
        serviceMock.stubbedFetchVehicleCompletionResult = .success(Success.vehicleData)
        serviceMock.invokedFetchVehicle = false

        // act
        presenter.getData()

        // assert
        XCTAssertFalse(serviceMock.invokedFetchStarship)
        XCTAssertTrue(serviceMock.invokedFetchVehicle)
    }

    // MARK: ShowAlertTests
    func testThatCallsShowErrorAlertIfGetCharacterFailure() {
        // arrange
        presenter.specs = Success.specsPrepared
        presenter.movie = Success.movieData
        serviceMock.stubbedFetchCharacterCompletionResult = .failure(Failure.error)

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(viewControllerMock.showAlertWasCalled)
    }

    func testThatCallsShowErrorAlertIfGetPlanetFailure() {
        // arrange
        presenter.specs = Success.specsPrepared
        presenter.movie = Success.movieDataWithoutCharacter // skip fetchCharacter
        serviceMock.stubbedFetchPlanetCompletionResult = .failure(Failure.error)

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(viewControllerMock.showAlertWasCalled)
    }

    func testThatCallsShowErrorAlertIfGetSpeciesFailure() {
        // arrange
        presenter.specs = Success.specsPrepared
        presenter.movie = Success.movieDataWithoutPlanet // skip fetchCharacter, fetchPlanet
        serviceMock.stubbedFetchSpeciesCompletionResult = .failure(Failure.error)

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(viewControllerMock.showAlertWasCalled)
    }

    func testThatCallsShowErrorAlertIfGetStarshipFailure() {
        // arrange
        presenter.specs = Success.specsPrepared
        presenter.movie = Success.movieDataWithoutSpecies // skip fetchCharacter, fetchPlanet, fetchSpecies
        serviceMock.stubbedFetchStarshipCompletionResult = .failure(Failure.error)

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(viewControllerMock.showAlertWasCalled)
    }

    func testThatCallsShowErrorAlertIfGetVehicleFailure() {
        // arrange
        presenter.specs = Success.specsPrepared
        presenter.movie = Success.movieDataWithoutStarship // skip fetchCharacter, fetchPlanet, fetchSpecies, fetchStarship
        serviceMock.stubbedFetchVehicleCompletionResult = .failure(Failure.error)

        // act
        presenter.getData()

        // assert
        XCTAssertTrue(viewControllerMock.showAlertWasCalled)
    }

}

private extension MovieDetailPresenterTests {

    enum Success {
        static let specsPrepared = Array(repeating: [EntityShortViewModel](), count: 5)
        static let movieData = MovieData(episodeId: 1, title: "Title", openingCrawl: "openingCrawl",
                                         director: "director", producer: "producer", releaseDate: "releaseDate",
                                         characters: ["characters/01/"], planets: ["planets/01/"],
                                         starships: ["starships/01/"], vehicles: ["vehicles/01/"],
                                         species: ["species/01/"], url: "url", imageData: nil)
        static let movieDataWithoutCharacter = MovieData(episodeId: 1, title: "Title", openingCrawl: "openingCrawl",
                                                         director: "director", producer: "producer",
                                                         releaseDate: "releaseDate", characters: [],
                                                         planets: ["planets/01/"], starships: ["starships/01/"],
                                                         vehicles: ["vehicles/01/"], species: ["species/01/"],
                                                         url: "url", imageData: nil)
        static let movieDataWithoutPlanet = MovieData(episodeId: 1, title: "Title", openingCrawl: "openingCrawl",
                                                         director: "director", producer: "producer",
                                                         releaseDate: "releaseDate", characters: [],
                                                         planets: [], starships: ["starships/01/"],
                                                         vehicles: ["vehicles/01/"], species: ["species/01/"],
                                                         url: "url", imageData: nil)
        static let movieDataWithoutSpecies = MovieData(episodeId: 1, title: "Title", openingCrawl: "openingCrawl",
                                                         director: "director", producer: "producer",
                                                         releaseDate: "releaseDate", characters: [],
                                                         planets: [], starships: ["starships/01/"],
                                                         vehicles: ["vehicles/01/"], species: [],
                                                         url: "url", imageData: nil)
        static let movieDataWithoutStarship = MovieData(episodeId: 1, title: "Title", openingCrawl: "openingCrawl",
                                                         director: "director", producer: "producer",
                                                         releaseDate: "releaseDate", characters: [],
                                                         planets: [], starships: [],
                                                         vehicles: ["vehicles/01/"], species: [],
                                                         url: "url", imageData: nil)
        static let movieDataWithoutVehicle = MovieData(episodeId: 1, title: "Title", openingCrawl: "openingCrawl",
                                                         director: "director", producer: "producer",
                                                         releaseDate: "releaseDate", characters: [],
                                                         planets: [], starships: [],
                                                         vehicles: [], species: [],
                                                         url: "url", imageData: nil)
        static let characterData = CharacterData(name: "name", birthYear: "birthYear", eyeColor: "eyeColor",
                                                 gender: "gender", hairColor: "hairColor", mass: "mass",
                                                 height: "height", skinColor: "skinColor", homeworld: "homeworld",
                                                 films: ["films/01/"], species: ["species/01/"],
                                                 starships: ["starships/01/"], vehicles: ["vehicles/01/"],
                                                 url: "url", imageData: nil)
        static let planetData = PlanetData(name: "name", diameter: "diameter", rotationPeriod: "rotationPeriod",
                                           orbitalPeriod: "orbitalPeriod", gravity: "gravity", population: "population",
                                           climate: "climate", terrain: "terrain", surfaceWater: "surfaceWater",
                                           films: ["films/01/"], residents: ["residents/01/"], url: "url", imageData: nil)
        static let speciesData = SpeciesData(name: "name", classification: "classification", designation: "designation",
                                             averageHeight: "averageHeight", averageLifespan: "averageLifespan",
                                             eyeColors: "eyeColors", hairColors: "hairColors", skinColors: "skinColors",
                                             language: "language", homeworld: "homeworld/01/", films: ["films/01/"],
                                             people: ["people/01/"], url: "url", imageData: nil)
        static let starshipData = StarshipData(name: "name", model: "model", starshipClass: "starshipClass",
                                               manufacturer: "manufacturer", costInCredits: "costInCredits",
                                               length: "length", crew: "crew", passengers: "passengers",
                                               maxAtmospheringSpeed: "maxAtmospheringSpeed",
                                               hyperdriveRating: "hyperdriveRating", MGLT: "MGLT",
                                               cargoCapacity: "cargoCapacity", consumables: "consumables",
                                               films: ["films/01/"], pilots: ["pilots/01/"], url: "url", imageData: nil)
        static let vehicleData = VehicleData(name: "name", model: "model", vehicleClass: "vehicleClass",
                                             manufacturer: "manufacturer", costInCredits: "costInCredits",
                                             length: "length", crew: "crew", passengers: "passengers",
                                             maxAtmospheringSpeed: "maxAtmospheringSpeed", cargoCapacity: "cargoCapacity",
                                             consumables: "consumables", films: ["films/01/"], pilots: ["pilots/01/"],
                                             url: "url", imageData: nil)
    }

    enum Failure {
        static let error = NetworkServiceError.unknown
    }
}
