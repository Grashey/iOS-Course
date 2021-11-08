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
        self.register(EntityCollectionViewCell.self, forCellWithReuseIdentifier: EntityCollectionViewCell.description())
        if let flowLayout = layout as? UICollectionViewFlowLayout {
            let size = CGSize(width: 100, height: 100)
            flowLayout.estimatedItemSize = size
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
