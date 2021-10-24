//
//  MovieDetailView.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 18.10.2021.
//

import UIKit

class MovieDetailView: UIView {

    let inset: CGFloat = 10
    
    let smallFont = UIFont(name: Constants.Fonts.font, size: 12)
    let mediumFont = UIFont(name: Constants.Fonts.font, size: 16)
    let bigFont = UIFont(name: Constants.Fonts.font, size: 18)
    
    let labelTextColor: UIColor = .white
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInset = UIEdgeInsets(top: inset, left: .zero, bottom: inset, right: .zero)
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var backgroundView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        guard let image = UIImage(named: Constants.ImageName.backgroundImage) else { return UIImageView() }
        view.image = image
        return view
    }()

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
        label.font = smallFont
        label.textColor = #colorLiteral(red: 0.9089605212, green: 0.8589437604, blue: 0.3372781873, alpha: 1)
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = bigFont
        label.textColor = labelTextColor
        return label
    }()
    
    lazy var openingCrawlLabel: UILabel = {
        let label = UILabel()
        label.font = mediumFont
        label.textColor = labelTextColor
        label.numberOfLines = 0
        return label
    }()
    
    lazy var directorLabel: UILabel = {
        let label = UILabel()
        label.font = smallFont
        label.textColor = labelTextColor
        return label
    }()
    
    lazy var producerLabel: UILabel = {
        let label = UILabel()
        label.font = smallFont
        label.textColor = labelTextColor
        return label
    }()
    
    lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = smallFont
        label.textColor = labelTextColor
        return label
    }()
    
    lazy var charactersLabel: UILabel = {
        let label = UILabel()
        label.font = smallFont
        label.textColor = labelTextColor
        return label
    }()
    
    lazy var planetsLabel: UILabel = {
        let label = UILabel()
        label.font = smallFont
        label.textColor = labelTextColor
        return label
    }()
    
    lazy var speciesLabel: UILabel = {
        let label = UILabel()
        label.font = smallFont
        label.textColor = labelTextColor
        return label
    }()
    
    lazy var starshipsLabel: UILabel = {
        let label = UILabel()
        label.font = smallFont
        label.textColor = labelTextColor
        return label
    }()
    
    lazy var vehiclesLabel: UILabel = {
        let label = UILabel()
        label.font = smallFont
        label.textColor = labelTextColor
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(backgroundView)
        self.addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(posterImageView)
        contentStackView.addArrangedSubview(infoStackView)
        let detailsArreay = [episodeLabel, nameLabel, openingCrawlLabel, directorLabel, producerLabel, releaseDateLabel, charactersLabel, planetsLabel, speciesLabel, starshipsLabel, vehiclesLabel]
        detailsArreay.forEach { infoStackView.addArrangedSubview($0) }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            backgroundView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            posterImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func configureWith(model: MovieViewModel) {
        guard let image = UIImage(named: "episode\(model.episodeNumber)") else { return }
        posterImageView.image = image
        episodeLabel.text = "Episode \(model.episodeNumber)"
        nameLabel.text = model.title
        openingCrawlLabel.text = model.annotation
        directorLabel.text = "Director: \(model.director)"
        producerLabel.text = "Producer: \(model.producer)"
        releaseDateLabel.text = "Release date: \(model.releaseDate)"
        charactersLabel.text = "Characters: SomeCharacters"
        planetsLabel.text = "Planets: SomePlanets"
        speciesLabel.text = "Species: SomeSpecies"
        starshipsLabel.text = "Starships: SomeStarships"
        vehiclesLabel.text = "vehicles: Somevehicles"
    }
}
