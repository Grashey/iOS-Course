//
//  ContainerViewController.swift
//  AutoLayoutApp
//
//  Created by Aleksandr Fetisov on 12.10.2021.
//

import UIKit

class ContainerViewController: UIViewController {
    
    let containerView = ContainerView()
    let genreVC = GenreTableViewController()
    let movieVC = MovieCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout.init())
    let movieDescriptionVC = MovieDescriptionViewController()
    
    var dataSource: DataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        dataSource = DataSource(tableView: genreVC.tableView,
                                collectionView: movieVC.collectionView,
                                movieDescriptionDelegate: movieDescriptionVC)
        addChild(controller: genreVC, containerView: containerView.genreView)
        addChild(controller: movieVC, containerView: containerView.movieView)
        addChild(controller: movieDescriptionVC, containerView: containerView.movieDescriptionView)
        genreVC.tableView.dataSource = dataSource
        genreVC.tableView.delegate = dataSource
        movieVC.collectionView.dataSource = dataSource
        movieVC.collectionView.delegate = dataSource
    }
    
    func setupView() {
        view.backgroundColor = .white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func addChild(controller: UIViewController, containerView: UIView) {
        containerView.addSubview(controller.view)
        self.addChild(controller)
        controller.didMove(toParent: self)
    }
}

