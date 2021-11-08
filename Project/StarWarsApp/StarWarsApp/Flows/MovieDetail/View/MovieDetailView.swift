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

    private var width = CGFloat()
    private let inset: CGFloat = 10
    private let smallFont = UIFont(name: Constants.Fonts.font, size: 12)
    private let mediumFont = UIFont(name: Constants.Fonts.font, size: 14)
    private let bigFont = UIFont(name: Constants.Fonts.font, size: 18)
    private let labelTextColor: UIColor = .white
    
    private lazy var scrollView: UIScrollView = {
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentInset = UIEdgeInsets(top: inset, left: .zero, bottom: inset, right: .zero)
        $0.showsVerticalScrollIndicator = false
        return $0
    }(UIScrollView())
    
    private lazy var backgroundView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(named: Constants.ImageName.backgroundImage) {
            $0.image = image
        }
        return $0
    }(UIImageView())

    private lazy var posterImageView: UIImageView = {
//        $0.layer.cornerRadius = 10
//        $0.layer.shadowOffset = CGSize.zero
//        $0.layer.shadowRadius = 5
//        $0.layer.shadowOpacity = 1
//        $0.layer.shadowColor = UIColor.white.cgColor
        return $0
    }(UIImageView())
    
    private lazy var episodeLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = #colorLiteral(red: 0.9089605212, green: 0.8589437604, blue: 0.3372781873, alpha: 1)
        $0.text = LabelValues.episode
        return $0
    }(UILabel())
    
    private lazy var episodeValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = #colorLiteral(red: 0.9089605212, green: 0.8589437604, blue: 0.3372781873, alpha: 1)
        return $0
    }(UILabel())
    
    private lazy var nameLabel: UILabel = {
        $0.font = bigFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var openingCrawlLabel: UILabel = {
        $0.font = mediumFont
        $0.textColor = labelTextColor
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
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
    
    private lazy var charactersLabel: BaseLabel = {
        $0.text = LabelValues.characters
        return $0
    }(BaseLabel())
    
    private lazy var planetsLabel: BaseLabel = {
        $0.text = LabelValues.planets
        return $0
    }(BaseLabel())
    
    private lazy var speciesLabel: BaseLabel = {
        $0.text = LabelValues.species
        return $0
    }(BaseLabel())
    
    private lazy var starshipsLabel: BaseLabel = {
        $0.text = LabelValues.starships
        return $0
    }(BaseLabel())
    
    private lazy var vehiclesLabel: BaseLabel = {
        $0.text = LabelValues.vehicles
        return $0
    }(BaseLabel())
    
    private lazy var directorValueLabel = BaseValueLabel()
    private lazy var producerValueLabel = BaseValueLabel()
    private lazy var releaseDateValueLabel = BaseValueLabel()
    private lazy var charactersValueLabel = BaseValueLabel()
    private lazy var planetsValueLabel = BaseValueLabel()
    private lazy var speciesValueLabel = BaseValueLabel()
    private lazy var starshipsValueLabel = BaseValueLabel()
    private lazy var vehiclesValueLabel = BaseValueLabel()
    
    private lazy var episodeStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.distribution = .fill
        stackview.alignment = .leading
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private lazy var directorStackView = BaseLabelStackView()
    private lazy var producerStackView = BaseLabelStackView()
    private lazy var releaseDateStackView = BaseLabelStackView()
    private lazy var charactersStackView = BaseLabelStackView()
    private lazy var planetsStackView = BaseLabelStackView()
    private lazy var speciesStackView = BaseLabelStackView()
    private lazy var starshipsStackView = BaseLabelStackView()
    private lazy var vehiclesStackView = BaseLabelStackView()
    
    private lazy var contentStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.spacing = inset
        stackview.distribution = .fill
        stackview.alignment = .center
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.distribution = .fillProportionally
        stackview.alignment = .leading
        return stackview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.width = frame.width
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
    
    func configureWith(model: MovieDetailViewModel) {
        guard let image = model.image else { return }
        posterImageView.image = resizeImage(image: image)
        
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
    
    private func resizeImage(image: UIImage) -> UIImage? {
        let constant: CGFloat = 40
        let size = image.size
        let sideRatio = (self.width + constant*2) / size.width
    
        let newSize = CGSize(width: size.width * sideRatio, height: size.height * sideRatio)
        let rect = CGRect(origin: .zero, size: newSize)
        let contentRect = CGRect(x: constant, y: constant*4, width: width, height: constant*6)
        
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
