//
//  StarshipDetailView.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import UIKit

class StarshipDetailView: UIView {
    
    private struct LabelValues {
        static let model = "Model: "
        static let starshipClass = "Starship class: "
        static let manufacturer = "Manufacturer: "
        static let costInCredits = "Cost in credits: "
        static let length = "Length: "
        static let crew = "Crew: "
        static let passengers = "Passengers capacity: "
        static let maxAtmospheringSpeed = "Max. atmosphering speed: "
        static let hyperdriveRating = "Hyperdrive rating: "
        static let maxNumberOfMegalights = "Max. number of megalights: "
        static let cargoCapacity = "Cargo capacity: "
        static let consumables = "Consumables: "
    }
    
    private struct ButtonLabelValues {
        static let movies = "Appearances in the movies"
        static let pilots = "Piloted by"
    }

    private let inset: CGFloat = 10
    private let smallFont = UIFont(name: Constants.Fonts.font, size: 12)
    private let bigFont = UIFont(name: Constants.Fonts.font, size: 18)
    private let labelTextColor: UIColor = .white
    private let titleColor: UIColor = #colorLiteral(red: 0.9089605212, green: 0.8589437604, blue: 0.3372781873, alpha: 1)
    
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

    private lazy var iconImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private lazy var nameLabel: UILabel = {
        $0.font = bigFont
        $0.textColor = #colorLiteral(red: 0.9089605212, green: 0.8589437604, blue: 0.3372781873, alpha: 1)
        return $0
    }(UILabel())
    
    private lazy var modelLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.model
        return $0
    }(UILabel())
    
    private lazy var modelValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var starshipClassLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.starshipClass
        return $0
    }(UILabel())
    
    private lazy var starshipClassValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())
    
    private lazy var manufacturerLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.manufacturer
        return $0
    }(UILabel())
    
    private lazy var manufacturerValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())
    
    private lazy var costInCreditsLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.costInCredits
        return $0
    }(UILabel())
    
    private lazy var costInCreditsValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var lengthLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.length
        return $0
    }(UILabel())
    
    private lazy var lengthValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var crewLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.crew
        return $0
    }(UILabel())
    
    private lazy var crewValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var passengersLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.passengers
        return $0
    }(UILabel())
    
    private lazy var passengersValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var cargoCapacityLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.cargoCapacity
        return $0
    }(UILabel())
    
    private lazy var cargoCapacityValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var maxAtmospheringSpeedLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.maxAtmospheringSpeed
        return $0
    }(UILabel())
    
    private lazy var maxAtmospheringSpeedValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var hyperdriveRatingLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.hyperdriveRating
        return $0
    }(UILabel())
    
    private lazy var hyperdriveRatingValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var maxNumberOfMegalightsLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.maxNumberOfMegalights
        return $0
    }(UILabel())
    
    private lazy var maxNumberOfMegalightsValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var consumablesLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.consumables
        return $0
    }(UILabel())
    
    private lazy var consumablesValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    lazy var moviesButton: UIButton = {
        $0.titleLabel?.font = smallFont
        $0.setTitleColor(titleColor, for: .normal)
        $0.setTitle(ButtonLabelValues.movies, for: .normal)
        return $0
    }(UIButton())
    
    lazy var pilotsButton: UIButton = {
        $0.titleLabel?.font = smallFont
        $0.setTitleColor(titleColor, for: .normal)
        $0.setTitle(ButtonLabelValues.pilots, for: .normal)
        return $0
    }(UIButton())
    
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
        $0.spacing = inset
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private lazy var modelStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var starshipClassStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var manufacturerStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var costInCreditsStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var lengthStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var crewStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var passengersStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var cargoCapacityStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var maxAtmospheringSpeedStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var hyperdriveRatingStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var maxNumberOfMegalightsStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var consumablesStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
     
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
        
        contentStackView.addArrangedSubview(iconImageView)
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(infoStackView)
        
        let stackArray = [modelStackView, starshipClassStackView, manufacturerStackView, costInCreditsStackView, lengthStackView, crewStackView, passengersStackView, cargoCapacityStackView, maxAtmospheringSpeedStackView, hyperdriveRatingStackView, maxNumberOfMegalightsStackView, consumablesStackView]
        let labelArray = [[modelLabel, modelValueLabel],
                          [starshipClassLabel, starshipClassValueLabel],
                          [manufacturerLabel, manufacturerValueLabel],
                          [costInCreditsLabel, costInCreditsValueLabel],
                          [lengthLabel, lengthValueLabel],
                          [crewLabel, crewValueLabel],
                          [passengersLabel, passengersValueLabel],
                          [cargoCapacityLabel, cargoCapacityValueLabel],
                          [maxAtmospheringSpeedLabel, maxAtmospheringSpeedValueLabel],
                          [hyperdriveRatingLabel, hyperdriveRatingValueLabel],
                          [maxNumberOfMegalightsLabel, maxNumberOfMegalightsValueLabel],
                          [consumablesLabel, consumablesValueLabel]
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
            
            iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            infoStackView.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor, constant: -inset*2)
        ])
    }
    
    func configureWith(model: StarshipViewModel) {
        guard let image = UIImage(named: "iconStarships") else { return }
        iconImageView.image = image
        
        nameLabel.text = model.name
        modelValueLabel.text = model.model
        starshipClassValueLabel.text = model.starshipClass
        manufacturerValueLabel.text = model.manufacturer
        costInCreditsValueLabel.text = model.costInCredits
        lengthValueLabel.text = model.length
        crewValueLabel.text = model.crew
        passengersValueLabel.text = model.passengers
        cargoCapacityValueLabel.text = model.cargoCapacity
        maxAtmospheringSpeedValueLabel.text = model.maxAtmospheringSpeed
        hyperdriveRatingValueLabel.text = model.hyperdriveRating
        maxNumberOfMegalightsValueLabel.text = model.maxNumberOfMegalights
        consumablesValueLabel.text = model.consumables
        
        if let _ = model.movies {
            infoStackView.addArrangedSubview(moviesButton)
        }
        
        if let _ = model.pilots {
            infoStackView.addArrangedSubview(pilotsButton)
        }
    }
}
