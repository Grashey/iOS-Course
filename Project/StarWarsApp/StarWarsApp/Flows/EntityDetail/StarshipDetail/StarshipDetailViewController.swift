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
        let model = StarshipViewModel(name: "Death Star", model: "DS-1 Orbital Battle Station", starshipClass: "Deep Space Mobile Battlestation", manufacturer: "Imperial Department of Military Research, Sienar Fleet Systems", costInCredits: "1000000000000", length: "120000", crew: "342953", passengers: "843342", maxAtmospheringSpeed: "n/a", hyperdriveRating: "4.0", maxNumberOfMegalights: "10 MGLT", cargoCapacity: "1000000000000", consumables: "3 years", movies: ["one"], pilots: ["Darth Vader"])
//        guard let model = presenter?.model else { return }
        starshipDetailView.configureWith(model: model)
        self.view.addSubview(starshipDetailView)
    }

}
