//
//  MenuViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 22.10.2021.
//

import UIKit

class MenuViewController: UIViewController {

    var completionHandler: ((EntityRoute) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        let containerView = MenuView(frame: view.frame)
        self.view.addSubview(containerView)

        containerView.charactersButton.addTarget(self, action: #selector(setEntityCharacters), for: .touchUpInside)
        containerView.planetsButton.addTarget(self, action: #selector(setEntityPlanets), for: .touchUpInside)
        containerView.speciesButton.addTarget(self, action: #selector(setEntitySpecies), for: .touchUpInside)
        containerView.starshipsButton.addTarget(self, action: #selector(setEntityStarships), for: .touchUpInside)
        containerView.vehiclesButton.addTarget(self, action: #selector(setEntityVehicles), for: .touchUpInside)
    }

    @objc func setEntityCharacters() {
        self.completionHandler?(EntityRoute.characters)
    }

    @objc func setEntityPlanets() {
        self.completionHandler?(EntityRoute.planets)
    }

    @objc func setEntitySpecies() {
        self.completionHandler?(EntityRoute.species)
    }

    @objc func setEntityStarships() {
        self.completionHandler?(EntityRoute.starships)
    }

    @objc func setEntityVehicles() {
        self.completionHandler?(EntityRoute.vehicles)
    }

}
