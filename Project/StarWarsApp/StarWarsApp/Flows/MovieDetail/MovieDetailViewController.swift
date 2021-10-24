//
//  MovieDetailViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 18.10.2021.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movieDetailView = MovieDetailView()
    var model: MovieViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        movieDetailView = MovieDetailView(frame: view.frame)
        movieDetailView.configureWith(model: model!)
        self.view.addSubview(movieDetailView)
    }

}
