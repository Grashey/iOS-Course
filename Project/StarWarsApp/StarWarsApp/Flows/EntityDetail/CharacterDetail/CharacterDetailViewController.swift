//
//  CharacterDetailViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 27.10.2021.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    var presenter: CharacterDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        let characterDetailView = CharacterDetailView(frame: view.frame)
        let model = CharacterViewModel(name: "Alex Smith", birthYear: "11.07.1981", eyeColor: "blue", gender: "male", hairColor: "Blond", mass: "80", height: "176", skinColor: "white", homeworld: "Earth", movies: ["one","two"], species: ["human"], starships: nil, vehicles: ["peugeot"])
//        guard let model = presenter?.model else { return }
        characterDetailView.configureWith(model: model)
        self.view.addSubview(characterDetailView)
    }

}
