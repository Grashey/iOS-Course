//
//  VehicleDetailViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 29.10.2021.
//

import UIKit

class VehicleDetailViewController: UIViewController {

    var presenter: VehicleDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        let vehicleDetailView = VehicleDetailView(frame: view.frame)
        let model = VehicleViewModel(name: "Sand Crawler", model: "Digger Crawler", vehicleClass: "wheeled", manufacturer: "Corellia Mining Corporation", costInCredits: "150000", length: "36.8", crew: "46", passengers: "30", maxAtmospheringSpeed: "30", cargoCapacity: "50000", consumables: "2 months", movies: ["one","two"], pilots: ["Alex Smith"])
//        guard let model = presenter?.model else { return }
        vehicleDetailView.configureWith(model: model)
        self.view.addSubview(vehicleDetailView)
    }

}
