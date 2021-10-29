//
//  MovieDetailView.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 18.10.2021.
//

import UIKit

class MovieDetailView: UIView {
    
    private struct LabelValues {
        static let episode = "Episode "
        static let director = "Director: "
        static let producer = "Producer: "
        static let releaseDate = "Release date: "
        static let characters = "Characters: "
        static let planets = "Planets: "
        static let species = "Species: "
        static let starships = "Starships: "
        static let vehicles = "vehicles: "
    }

    let inset: CGFloat = 10
    let smallFont = UIFont(name: Constants.Fonts.font, size: 12)
    let mediumFont = UIFont(name: Constants.Fonts.font, size: 16)
    let bigFont = UIFont(name: Constants.Fonts.font, size: 18)
    let labelTextColor: UIColor = .white
    
    lazy var scrollView: UIScrollView = {
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentInset = UIEdgeInsets(top: inset, left: .zero, bottom: inset, right: .zero)
        $0.showsVerticalScrollIndicator = false
        return $0
    }(UIScrollView())
    
    lazy var backgroundView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(named: Constants.ImageName.backgroundImage) {
            $0.image = image
        }
        return $0
    }(UIImageView())

    lazy var posterImageView: UIImageView = {
        $0.layer.cornerRadius = 10
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.shadowRadius = 5
        $0.layer.shadowOpacity = 1
        $0.layer.shadowColor = UIColor.white.cgColor
        return $0
    }(UIImageView())
    
    lazy var episodeLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = #colorLiteral(red: 0.9089605212, green: 0.8589437604, blue: 0.3372781873, alpha: 1)
        $0.text = LabelValues.episode
        return $0
    }(UILabel())
    
    lazy var episodeValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = #colorLiteral(red: 0.9089605212, green: 0.8589437604, blue: 0.3372781873, alpha: 1)
        return $0
    }(UILabel())
    
    lazy var nameLabel: UILabel = {
        $0.font = bigFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    lazy var openingCrawlLabel: UILabel = {
        $0.font = mediumFont
        $0.textColor = labelTextColor
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    lazy var directorLabel: BaseLabel = {
        $0.text = LabelValues.director
        return $0
    }(BaseLabel())
    
    lazy var producerLabel: BaseLabel = {
        $0.text = LabelValues.producer
        return $0
    }(BaseLabel())
    
    lazy var releaseDateLabel: BaseLabel = {
        $0.text = LabelValues.releaseDate
        return $0
    }(BaseLabel())
    
    lazy var charactersLabel: BaseLabel = {
        $0.text = LabelValues.characters
        return $0
    }(BaseLabel())
    
    lazy var planetsLabel: BaseLabel = {
        $0.text = LabelValues.planets
        return $0
    }(BaseLabel())
    
    lazy var speciesLabel: BaseLabel = {
        $0.text = LabelValues.species
        return $0
    }(BaseLabel())
    
    lazy var starshipsLabel: BaseLabel = {
        $0.text = LabelValues.starships
        return $0
    }(BaseLabel())
    
    lazy var vehiclesLabel: BaseLabel = {
        $0.text = LabelValues.vehicles
        return $0
    }(BaseLabel())
    
    lazy var directorValueLabel = BaseValueLabel()
    lazy var producerValueLabel = BaseValueLabel()
    lazy var releaseDateValueLabel = BaseValueLabel()
    lazy var charactersValueLabel = BaseValueLabel()
    lazy var planetsValueLabel = BaseValueLabel()
    lazy var speciesValueLabel = BaseValueLabel()
    lazy var starshipsValueLabel = BaseValueLabel()
    lazy var vehiclesValueLabel = BaseValueLabel()
    
    lazy var episodeStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.distribution = .fill
        stackview.alignment = .leading
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    lazy var directorStackView = BaseLabelStackView()
    lazy var producerStackView = BaseLabelStackView()
    lazy var releaseDateStackView = BaseLabelStackView()
    lazy var charactersStackView = BaseLabelStackView()
    lazy var planetsStackView = BaseLabelStackView()
    lazy var speciesStackView = BaseLabelStackView()
    lazy var starshipsStackView = BaseLabelStackView()
    lazy var vehiclesStackView = BaseLabelStackView()
    
    lazy var contentStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.spacing = inset
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
        contentStackView.addArrangedSubview(episodeStackView)
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(openingCrawlLabel)
        contentStackView.addArrangedSubview(infoStackView)
        
        episodeStackView.addArrangedSubview(episodeLabel)
        episodeStackView.addArrangedSubview(episodeValueLabel)
        

        
        let stackArray = [directorStackView, producerStackView, releaseDateStackView, charactersStackView, planetsStackView, speciesStackView, starshipsStackView, vehiclesStackView]
        let labelArray = [[directorLabel, directorValueLabel],
                          [producerLabel, producerValueLabel],
                          [releaseDateLabel, releaseDateValueLabel],
                          [charactersLabel, charactersValueLabel],
                          [planetsLabel, planetsValueLabel],
                          [speciesLabel, speciesValueLabel],
                          [starshipsLabel, starshipsValueLabel],
                          [vehiclesLabel, vehiclesValueLabel]
        ]
        for index in Int.zero ..< stackArray.count {
            infoStackView.addArrangedSubview(stackArray[index])
            if let firstLabel = labelArray[index].first, let lastLabel = labelArray[index].last {
                stackArray[index].addArrangedSubview(firstLabel)
                stackArray[index].addArrangedSubview(lastLabel)
            }
        }
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
            
            posterImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            infoStackView.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor, constant: -inset*2)
        ])
    }
    
    func configureWith(model: MovieViewModel) {
        guard let image = UIImage(named: "episode\(model.episodeNumber)") else { return }
        posterImageView.image = image
        
        episodeValueLabel.text = String(model.episodeNumber)
        nameLabel.text = model.title
        openingCrawlLabel.text = model.annotation
        directorValueLabel.text = model.director
        producerValueLabel.text = model.producer
        releaseDateValueLabel.text = model.releaseDate
        
        charactersValueLabel.text = "SomeCharacters"
        planetsValueLabel.text = "SomePlanets"
        speciesValueLabel.text = "SomeSpecies"
        starshipsValueLabel.text = "SomeStarships"
        vehiclesValueLabel.text = "Somevehicles"
    }
}
