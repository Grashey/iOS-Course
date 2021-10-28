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
        let model = PlanetViewModel(name: "Earth", diameter: "smthing", rotationPeriod: "24", orbitalPeriod: "30", gravity: "1-1", population: "7 000 000 000", climate: "average", terrain: "flat", waterSurface: "70", movies: ["one", "two"], residents: ["Alex Smith"])
//        guard let model = presenter?.model else { return }
        planetDetailView.configureWith(model: model)
        self.view.addSubview(planetDetailView)
    }

}
