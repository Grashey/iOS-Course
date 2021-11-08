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
        guard let model = presenter?.makeViewModel() else { return }
        characterDetailView.configureWith(model: model)
        self.view.addSubview(characterDetailView)
    }

}
