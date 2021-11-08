//
//  SpeciesDetailViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import UIKit

class SpeciesDetailViewController: UIViewController {

    var presenter: SpeciesDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        let speciesDetailView = SpeciesDetailView(frame: view.frame)
        guard let model = presenter?.makeViewModel() else { return }
        speciesDetailView.configureWith(model: model)
        self.view.addSubview(speciesDetailView)
    }

}
