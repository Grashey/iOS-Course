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
        label.clipsToBounds = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureLabel(text: String, color: UIColor) {
        label.text = text
        label.backgroundColor = color
    }

}
