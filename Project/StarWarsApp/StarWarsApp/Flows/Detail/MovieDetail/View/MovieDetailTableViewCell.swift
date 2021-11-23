//
//  MovieDetailTableViewCell.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 18.10.2021.
//

import UIKit

class MovieDetailTableViewCell: UITableViewCell {

    private enum LabelValues {
        static let episode = "Episode "
        static let director = "Director :"
        static let producer = "Producer :"
        static let releaseDate = "Release date :"
        static let related = "Relataed to :"
    }

    private let inset: CGFloat = 10
    private let smallFont = UIFont(name: Constants.Fonts.font, size: 14)
    private let mediumFont = UIFont(name: Constants.Fonts.font, size: 18)
    private let bigFont = UIFont(name: Constants.Fonts.font, size: 22)
    private let labelTextColor: UIColor = .lightGray
    private let alternativeColor: UIColor = #colorLiteral(red: 0.9089605212, green: 0.8589437604, blue: 0.3372781873, alpha: 1)

    private lazy var posterImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    private lazy var episodeLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = alternativeColor
        $0.text = LabelValues.episode
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private lazy var episodeValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = alternativeColor
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private lazy var nameLabel: UILabel = {
        $0.font = bigFont
        $0.textColor = alternativeColor
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private lazy var openingCrawlLabel: UILabel = {
        $0.font = mediumFont
        $0.textColor = alternativeColor
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private lazy var directorLabel: BaseLabel = {
        $0.text = LabelValues.director
        return $0
    }(BaseLabel())

    private lazy var producerLabel: BaseLabel = {
        $0.text = LabelValues.producer
        return $0
    }(BaseLabel())

    private lazy var releaseDateLabel: BaseLabel = {
        $0.text = LabelValues.releaseDate
        return $0
    }(BaseLabel())

    private lazy var relatedLabel: BaseLabel = {
        $0.text = LabelValues.related
        return $0
    }(BaseLabel())

    private lazy var directorValueLabel = BaseValueLabel()
    private lazy var producerValueLabel = BaseValueLabel()
    private lazy var releaseDateValueLabel = BaseValueLabel()

    private lazy var episodeStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private lazy var directorStackView = BaseLabelStackView()
    private lazy var producerStackView = BaseLabelStackView()
    private lazy var releaseDateStackView = BaseLabelStackView()

    private lazy var contentStackView: UIStackView = {
        $0.axis = .vertical
        $0.spacing = inset
        $0.distribution = .fill
        $0.alignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private lazy var infoStackView: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

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
        self.addSubview(contentStackView)

        contentStackView.addArrangedSubview(posterImageView)
        contentStackView.addArrangedSubview(episodeStackView)
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(openingCrawlLabel)
        contentStackView.addArrangedSubview(infoStackView)

        episodeStackView.addArrangedSubview(episodeLabel)
        episodeStackView.addArrangedSubview(episodeValueLabel)

        let stackArray = [directorStackView, producerStackView, releaseDateStackView]
        let labelArray = [[directorLabel, directorValueLabel],
                          [producerLabel, producerValueLabel],
                          [releaseDateLabel, releaseDateValueLabel]
                        ]

        for index in Int.zero ..< stackArray.count {
            infoStackView.addArrangedSubview(stackArray[index])
            if let firstLabel = labelArray[index].first, let lastLabel = labelArray[index].last {
                stackArray[index].addArrangedSubview(firstLabel)
                stackArray[index].addArrangedSubview(lastLabel)
            }
        }
        infoStackView.addArrangedSubview(relatedLabel)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: self.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            posterImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            posterImageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            infoStackView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
        producerLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
    }

    func configureWith(model: MovieDetailViewModel) {
        guard let image = model.image else { return }
        posterImageView.image = resizeImage(image: image)

        episodeValueLabel.text = String(model.episodeNumber)
        nameLabel.text = model.title
        openingCrawlLabel.text = model.annotation
        directorValueLabel.text = model.director
        producerValueLabel.text = model.producer
        releaseDateValueLabel.text = model.releaseDate
    }

    private func resizeImage(image: UIImage) -> UIImage? {
        let constant: CGFloat = 40
        let size = image.size
        let sideRatio = (contentView.frame.width + constant*2) / size.width

        let newSize = CGSize(width: size.width * sideRatio, height: size.height * sideRatio)
        let rect = CGRect(origin: .zero, size: newSize)
        let contentRect = CGRect(x: constant, y: constant*4, width: contentView.frame.width, height: constant*6)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 1)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        let croppedCGImage = newImage?.cgImage?.cropping(to: contentRect)
        guard let croppedImage = croppedCGImage else { return UIImage() }
        let croppedUIImage: UIImage = UIImage(cgImage: croppedImage)

        return croppedUIImage
    }
}
