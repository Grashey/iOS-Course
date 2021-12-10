//
//  MovieTableViewCell.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 18.10.2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    private enum LabelValues {
        static let episode = "Episode "
    }

    private let inset: CGFloat = 10
    private let posterImageSize = CGSize(width: 200, height: 300)
    private let alternativeColor: UIColor = #colorLiteral(red: 0.9089605212, green: 0.8589437604, blue: 0.3372781873, alpha: 1)

    private lazy var posterImageView: UIImageView = {
        $0.layer.cornerRadius = 10
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.shadowRadius = 5
        $0.layer.shadowOpacity = 1
        $0.layer.shadowColor = UIColor.white.cgColor
        return $0
    }(UIImageView())

    private lazy var episodeLabel: UILabel = {
        $0.font = UIFont(name: Constants.Fonts.main, size: 12)
        $0.textColor = alternativeColor
        $0.text = LabelValues.episode
        return $0
    }(UILabel())

    private lazy var episodeValueLabel: UILabel = {
        $0.font = UIFont(name: Constants.Fonts.main, size: 12)
        $0.textColor = alternativeColor
        return $0
    }(UILabel())

    private lazy var nameLabel: UILabel = {
        $0.font = UIFont(name: Constants.Fonts.main, size: 18)
        $0.textColor = alternativeColor
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())

    private lazy var contentStackView: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .center
        $0.spacing = inset
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private lazy var infoStackView: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.alignment = .center
        return $0
    }(UIStackView())

    private lazy var episodeStackView: BaseLabelStackView = {
        return $0
    }(BaseLabelStackView())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        addSubviews()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        contentView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(posterImageView)
        contentStackView.addArrangedSubview(infoStackView)
        infoStackView.addArrangedSubview(episodeStackView)
        infoStackView.addArrangedSubview(nameLabel)
        episodeStackView.addArrangedSubview(episodeLabel)
        episodeStackView.addArrangedSubview(episodeValueLabel)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2*inset),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    func configureWith(model: MovieViewModel) {
        episodeValueLabel.text = String(model.episodeNumber)
        nameLabel.text = model.title
        guard let image = model.image else { return }
        posterImageView.image = resizeImage(image: image, targetSize: posterImageSize)
    }

    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        let newSize = CGSize(width: size.width * widthRatio, height: size.height * heightRatio)
        let rect = CGRect(origin: .zero, size: newSize)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 1)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}
