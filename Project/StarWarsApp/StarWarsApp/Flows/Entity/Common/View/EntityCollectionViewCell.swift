//
//  EntityCollectionViewCell.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 22.10.2021.
//

import UIKit

class EntityCollectionViewCell: UICollectionViewCell {

    private let inset: CGFloat = 10

    private lazy var imageView: UIImageView = {
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    private lazy var label: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont(name: Constants.Fonts.main, size: 10)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textColor = .white
        $0.textAlignment = .center
        return $0
    }(UILabel())

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .clear
        addSubviews()
        addConstraints()
        self.layoutIfNeeded()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(label)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            label.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: inset/2),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
        ])
    }

    func configureWith(model: EntityShortViewModel, imageSize: CGSize) {
        self.label.text = model.name
        guard let image = model.image else { return }
        self.imageView.image = resizeImage(image: image, targetSize: imageSize)
    }

    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        let sideRatio = targetSize.width / size.width
        let newSize = CGSize(width: size.width * sideRatio, height: size.height * sideRatio)
        let rect = CGRect(origin: .zero, size: newSize)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 1)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}
