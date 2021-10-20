//
//  MovieDetailViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 18.10.2021.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var moviewDetailView = MovieDetailView()
    var model: MovieViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        moviewDetailView = MovieDetailView(frame: view.frame)
        moviewDetailView.configureWith(model: model!)
        self.view.addSubview(moviewDetailView)
    }

}
