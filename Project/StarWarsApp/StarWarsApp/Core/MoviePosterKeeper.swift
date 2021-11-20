//
//  MoviePosterKeeper.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.11.2021.
//

import UIKit

class MoviePosterKeeper {

    private let defaults = UserDefaults.standard

    func savePoster(for model: MovieViewModel) {
        let data = model.image?.pngData()
        defaults.set(data, forKey: model.title)
    }

    func loadPoster(for title: String) -> UIImage {
        if let data = defaults.object(forKey: title) as? Data, let poster = UIImage(data: data) {
            return poster
        }
        return UIImage()
    }

}
