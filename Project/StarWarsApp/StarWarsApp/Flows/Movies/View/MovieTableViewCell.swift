//
//  MovieTableViewCell.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 18.10.2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    let inset: CGFloat = 10

    lazy var posterImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    lazy var episodeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()

    lazy var openingCrawlLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    lazy var detailsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Подробнее", for: .normal)
        button.backgroundColor = .green
        return button
    }()
    
    lazy var contentStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.distribution = .fill
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 10
        return stackview
    }()
    
    lazy var infoStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.distribution = .fill
        return stackview
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset))
    }
    
    private func addSubviews() {
        contentView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(posterImageView)
        contentStackView.addArrangedSubview(infoStackView)
        infoStackView.addArrangedSubview(episodeLabel)
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(openingCrawlLabel)
        infoStackView.addArrangedSubview(detailsButton)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
        
        openingCrawlLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        posterImageView.setContentHuggingPriority(.required, for: .horizontal)
        infoStackView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
    
    func configureWith(model: MovieViewModel) {
        guard let image = UIImage(named: "episode\(model.episodeNumber)") else { return }
        posterImageView.image = resizeImage(image: image, targetWidth: (contentView.frame.width + 2*inset)/3)
        episodeLabel.text = "Episode \(model.episodeNumber)"
        nameLabel.text = model.title
        openingCrawlLabel.text = model.annotation
    }
    
    private func resizeImage(image: UIImage, targetWidth: CGFloat) -> UIImage {
        let size = image.size
        let ratio = size.height/size.width
        let newSize = CGSize(width: CGFloat(roundf(Float(targetWidth))), height: targetWidth*ratio)
        let rect = CGRect(x: .zero, y: .zero, width: newSize.width, height: newSize.height)

        UIGraphicsBeginImageContext(newSize)
        image.draw(in: rect)
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
        UIGraphicsEndImageContext()

        return newImage
    }
    
}
