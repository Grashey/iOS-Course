//
//  FavoritesViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 24.11.2021.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController {

    var presenter: FavoritesPresenterProtocol?

    lazy var collectionView = EntityCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())

    override func loadView() {
        view = collectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getData()
        navigationItem.title = Constants.TabBarTitle.favorites
        collectionView.dataSource = self
        collectionView.register(EntityCollectionViewCell.self, forCellWithReuseIdentifier: EntityCollectionViewCell.description())
        if let image = UIImage(named: Constants.ImageName.backgroundImage) {
            collectionView.backgroundView = UIImageView(image: image)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Remove All", style: .plain, target: self, action: #selector(removeAll))
        switchButton()
    }

    @objc func removeAll() {
        presenter?.removeAll()
    }

    private func switchButton() {
        guard let isEmpty = presenter?.viewModel.isEmpty else { return }
        if isEmpty {
            navigationItem.rightBarButtonItem?.isEnabled = false
        } else {
            navigationItem.rightBarButtonItem?.isEnabled = true
        }
    }

}

extension FavoritesViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.viewModel.count ?? .zero
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EntityCollectionViewCell.description(), for: indexPath)
        if let model = presenter?.viewModel[indexPath.item] {
            if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                let cellsInRowCount: Float = 3
                let overalLineSpacing: CGFloat = flowLayout.minimumLineSpacing*2
                let side = CGFloat(roundf(Float((collectionView.visibleSize.width - overalLineSpacing))/cellsInRowCount))
                let size = CGSize(width: side, height: side)
                (cell as? EntityCollectionViewCell)?.configureWith(model: model, imageSize: size)
            }
        }
        return cell
    }
}

extension FavoritesViewController: NSFetchedResultsControllerDelegate {

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        presenter?.makeModels()
        switchButton()
        collectionView.reloadData()
    }
}
