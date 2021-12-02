//
//  MoviePosterKeeper.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.11.2021.
//

import UIKit

protocol ImageKeeperProtocol {

    func saveImage(for model: MovieViewModel)
    func getImage(for title: String) -> UIImage
}

class MoviePosterKeeper: ImageKeeperProtocol {

    private let defaults = UserDefaults.standard

    func saveImage(for model: MovieViewModel) {
        let data = model.image?.pngData()
        defaults.set(data, forKey: model.title)
    }

    func getImage(for title: String) -> UIImage {
        if let data = defaults.object(forKey: title) as? Data, let poster = UIImage(data: data) {
            return poster
        }
        return UIImage()
    }

}
