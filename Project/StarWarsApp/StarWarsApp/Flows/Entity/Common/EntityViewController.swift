//
//  EntityViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 20.10.2021.
//

import UIKit

class EntityViewController: SpinnerManager {
    
    var presenter: EntityPresenterProtocol?
    var onDetails: ((String) -> Void)?

    lazy var collectionView = EntityCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    override func loadView() {
        view = collectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        presenter?.start()
        guard let image = UIImage(named: Constants.ImageName.backgroundImage) else { return }
        collectionView.backgroundView = UIImageView(image: image)
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
                let side = (collectionView.visibleSize.width - flowLayout.minimumLineSpacing*3)/3
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
        onDetails?(model.name)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let count = presenter?.viewModel.count else { return }
        if indexPath.item == count - 1, !isLoading {
            presenter?.getData()
        }
    }
}
