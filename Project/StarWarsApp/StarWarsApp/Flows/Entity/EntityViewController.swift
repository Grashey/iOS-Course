//
//  EntityViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 20.10.2021.
//

import UIKit

class EntityViewController: UIViewController {
    
    var presenter: EntityPresenterProtocol?
    
    var onDetails: ((Entity) -> Void)?

    override func viewDidLoad() {
        self.view.backgroundColor = .white
        presenter?.getData()
    }

}
