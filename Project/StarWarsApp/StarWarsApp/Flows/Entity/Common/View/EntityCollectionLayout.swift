//
//  EntityCollectionLayout.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 18.11.2021.
//

import UIKit

class EntityCollectionLayout: UICollectionViewFlowLayout {
    
    var cacheAttributes = [IndexPath: UICollectionViewLayoutAttributes]()
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = self.collectionView,
              let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        guard itemsCount > 0 else { return }
        
        
        // TODO: сделать смещение точки ориджин!!!
        for index in 0..<itemsCount {
            let indexPath = IndexPath(item: index, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            let side = CGFloat(roundf(Float((collectionView.visibleSize.width - flowLayout.minimumLineSpacing*2))/3))
            attributes.frame = CGRect(x: .zero, y: .zero, width: side, height: side)
            cacheAttributes[indexPath] = attributes
            }
        }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cacheAttributes.values.filter { attributes in
            return rect.intersects(attributes.frame)
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cacheAttributes[indexPath]
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: collectionView?.frame.width ?? 0,
                      height: collectionView?.frame.height ?? 0)
    }
}
