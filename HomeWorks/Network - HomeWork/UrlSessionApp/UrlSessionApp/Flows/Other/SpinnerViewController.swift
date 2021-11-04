//
//  SpinnerViewController.swift
//  UrlSessionApp
//
//  Created by Aleksandr Fetisov on 02.11.2021.
//

import UIKit

class SpinnerViewController: UIViewController {
    private let spinner = UIActivityIndicatorView(style: .large)

    override func loadView() {
        view = UIView()
        view.backgroundColor = .clear
        
        spinner.color = .white
        spinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spinner)
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        spinner.startAnimating()
    }
}
