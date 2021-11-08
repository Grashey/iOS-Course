//
//  StarshipDetailViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import UIKit

class StarshipDetailViewController: UIViewController {

    var presenter: StarshipDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        let starshipDetailView = StarshipDetailView(frame: view.frame)
        guard let model = presenter?.makeViewModel() else { return }
        starshipDetailView.configureWith(model: model)
        self.view.addSubview(starshipDetailView)
    }

}
