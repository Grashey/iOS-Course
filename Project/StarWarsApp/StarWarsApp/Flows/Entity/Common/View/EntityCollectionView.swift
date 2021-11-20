//
//  EntityCollectionView.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 27.10.2021.
//

import UIKit

class EntityCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)

        if let flowLayout = layout as? UICollectionViewFlowLayout {
            let size = CGSize(width: 130, height: 130)
            flowLayout.estimatedItemSize = size
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
