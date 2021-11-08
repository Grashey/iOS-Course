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
        presenter?.getData()
    }
    
    func makeView() {
        let characterDetailView = CharacterDetailView(frame: view.frame)
        guard let model = presenter?.model else { return }
        characterDetailView.configureWith(model: model)
        self.view.addSubview(characterDetailView)
    }

}
