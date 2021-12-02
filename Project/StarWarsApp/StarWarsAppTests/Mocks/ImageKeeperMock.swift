//
//  ImageKeeperMock.swift
//  StarWarsAppTests
//
//  Created by Aleksandr Fetisov on 01.12.2021.
//

@testable import StarWarsApp
import UIKit

class ImageKeeperMock: ImageKeeperProtocol {

    var saveImageWasCalled = false

    func saveImage(for model: MovieViewModel) {
        saveImageWasCalled = true
    }

    var getImageWasCalled = false

    func getImage(for title: String) -> UIImage {
        getImageWasCalled = true
        return UIImage()
    }
}
