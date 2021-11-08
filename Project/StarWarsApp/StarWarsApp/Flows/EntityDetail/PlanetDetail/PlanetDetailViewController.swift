//
//  PlanetDetailViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import UIKit

class PlanetDetailViewController: UIViewController {

    var presenter: PlanetDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        let planetDetailView = PlanetDetailView(frame: view.frame)
        guard let model = presenter?.makeViewModel() else { return }
        planetDetailView.configureWith(model: model)
        self.view.addSubview(planetDetailView)
    }

}
