//
//  EntityViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 20.10.2021.
//

import UIKit

class EntityViewController: SpinnerManager {

    var presenter: EntityPresenterProtocol?
    var onDetails: ((TransferDataProtocol) -> Void)?

    lazy var collectionView = EntityCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())

    override func loadView() {
        view = collectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(EntityCollectionViewCell.self, forCellWithReuseIdentifier: EntityCollectionViewCell.description())
        if let image = UIImage(named: Constants.ImageName.backgroundImage) {
            collectionView.backgroundView = UIImageView(image: image)
        }

        presenter?.getData()
    }

    func reloadView() {
        collectionView.reloadData()
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: Constants.AlertTitle.message,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.AlertTitle.okey, style: .default, handler: nil))
        present(alert, animated: true)
    }

}

extension EntityViewController: UICollectionViewDataSource {

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

extension EntityViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let model = presenter?.viewModel[indexPath.item] else { return }
        guard let entity = presenter?.makeEntity(name: model.name) else { return }
        onDetails?(entity)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let count = presenter?.viewModel.count else { return }
        if indexPath.item == count - 1, !isLoading {
            presenter?.getData()
        }
    }
}
