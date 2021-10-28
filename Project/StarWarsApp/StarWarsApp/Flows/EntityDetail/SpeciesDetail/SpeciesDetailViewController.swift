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
        let model = SpeciesViewModel(name: "Human", classification: "mammal", designation: "sentient", averageHeight: "180", averageLifespan: "120", eyeColors: "brown, blue, green, hazel, grey", hairColors: "blonde, brown, black, red", skinColors: "caucasian, black, asian", language: "Galactic Basic", homeworld: "Earth", movies: ["one","two"], characters: ["Alex Smith"])
//        guard let model = presenter?.model else { return }
        speciesDetailView.configureWith(model: model)
        self.view.addSubview(speciesDetailView)
    }

}
