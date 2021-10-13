//
//  MovieDescriptionViewController.swift
//  AutoLayoutApp
//
//  Created by Aleksandr Fetisov on 13.10.2021.
//

import UIKit

protocol MovieDescriptionDelegate {
    
    func configureLabel(text: String, color: UIColor)
}

class MovieDescriptionViewController: UIViewController, MovieDescriptionDelegate {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 16)
        label.layer.cornerRadius = 10
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview()
        addConstraints()
    }
    
    func addSubview() {
        view.addSubview(label)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureLabel(text: String, color: UIColor) {
        label.text = text
        label.backgroundColor = color
    }

}
