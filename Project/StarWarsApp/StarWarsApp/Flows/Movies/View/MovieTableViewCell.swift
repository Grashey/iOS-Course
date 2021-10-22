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
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 1
        view.layer.shadowColor = UIColor.white.cgColor
        return view
    }()
    
    lazy var episodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Fonts.font, size: 12)
        label.textColor = #colorLiteral(red: 0.9089605212, green: 0.8589437604, blue: 0.3372781873, alpha: 1)
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Fonts.font, size: 18)
        label.textColor = .white
        return label
    }()
    
    lazy var contentStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.distribution = .fill
        stackview.alignment = .center
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    lazy var infoStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.distribution = .fillEqually
        stackview.alignment = .leading
        return stackview
    }()
    
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
        infoStackView.addArrangedSubview(episodeLabel)
        infoStackView.addArrangedSubview(nameLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2*inset),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    func configureWith(model: MovieViewModel) {
        guard let image = UIImage(named: "episode\(model.episodeNumber)") else { return }
        posterImageView.image = image
        episodeLabel.text = "Episode \(model.episodeNumber)"
        nameLabel.text = model.title
    }
    
}
