//
//  MoviePresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.10.2021.
//

import Foundation

class MoviePresenter: MoviePresenterProtocol {
    
    weak var viewController: MovieViewController?
    var viewModel: [MovieViewModel]?
    var movies: [Movie] = []
    
    //temporary data
    let film1 = Movie(title: "Title1", episodeNumber: 1, annotation: "some info1", director: "director1", producer: "producer1", releaseDate: "someDate1")
    let film2 = Movie(title: "Title2", episodeNumber: 2, annotation: "some info2", director: "director2", producer: "producer2", releaseDate: "someDate2")
    let film3 = Movie(title: "Title3", episodeNumber: 3, annotation: "some info3", director: "director3", producer: "producer3", releaseDate: "someDate3")
    let film4 = Movie(title: "Title4", episodeNumber: 4, annotation: "some info4", director: "director4", producer: "producer4", releaseDate: "someDate4")
    let film5 = Movie(title: "Title5", episodeNumber: 5, annotation: "some info5", director: "director5", producer: "producer5", releaseDate: "someDate5")
    let film6 = Movie(title: "Title6", episodeNumber: 6, annotation: "some info6", director: "director6", producer: "producer6", releaseDate: "someDate6")
    
    func getData() {
        movies = [film1, film2, film3, film4, film5, film6]
        self.viewModel = movies.map { MovieViewModel(title: $0.title,
                                                    episodeNumber: $0.episodeNumber,
                                                    annotation: $0.annotation,
                                                    director: $0.director,
                                                    producer: $0.producer,
                                                     releaseDate: $0.releaseDate) }
        viewController?.reload()
    }
    
}

//temporary data
struct Movie {
    let title: String
    let episodeNumber: Int
    let annotation: String
    let director: String
    let producer: String
    let releaseDate: String
}
