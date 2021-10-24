//
//  MovieDetailViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 18.10.2021.
//

import UIKit

class MovieDetailViewController: UIViewController {

    var presenter: MovieDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        let movieDetailView = MovieDetailView(frame: view.frame)
        guard let model = presenter?.model else { return }
        movieDetailView.configureWith(model: model)
        self.view.addSubview(movieDetailView)
    }

}
