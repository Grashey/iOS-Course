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
        guard let model = presenter?.makeViewModel() else { return }
        vehicleDetailView.configureWith(model: model)
        self.view.addSubview(vehicleDetailView)
    }

}
