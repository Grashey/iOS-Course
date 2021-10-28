//
//  PlanetDetailView.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import UIKit

class PlanetDetailView: UIView {
    
    private struct LabelValues {
        static let diameter = "Diameter: "
        static let rotationPeriod = "Rotation period: "
        static let orbitalPeriod = "Orbital period: "
        static let gravity = "Gravity: "
        static let population = "Population: "
        static let climate = "Climate: "
        static let terrain = "Terrain: "
        static let surfaceWater = "Surface water: "
    }
    
    private struct ButtonLabelValues {
        static let movies = "Appearances in the movies"
        static let residents = "Residents"
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
    
    private lazy var diameterLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.diameter
        return $0
    }(UILabel())
    
    private lazy var diameterValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var rotationPeriodLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.rotationPeriod
        return $0
    }(UILabel())
    
    private lazy var rotationPeriodValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var orbitalPeriodLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.orbitalPeriod
        return $0
    }(UILabel())
    
    private lazy var orbitalPeriodValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var gravityLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.gravity
        return $0
    }(UILabel())
    
    private lazy var gravityValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var populationLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.population
        return $0
    }(UILabel())
    
    private lazy var populationValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var climateLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.climate
        return $0
    }(UILabel())
    
    private lazy var climateValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var terrainLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.terrain
        return $0
    }(UILabel())
    
    private lazy var terrainValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var surfaceWaterLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.surfaceWater
        return $0
    }(UILabel())
    
    private lazy var surfaceWaterValueLabel: UILabel = {
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
    
    lazy var residentsButton: UIButton = {
        $0.titleLabel?.font = smallFont
        $0.setTitleColor(titleColor, for: .normal)
        $0.setTitle(ButtonLabelValues.residents, for: .normal)
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

    private lazy var diameterStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var rotationPeriodStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var orbitalPeriodStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var gravityStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var populationStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var climateStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var terrainStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var surfaceWaterStackView: UIStackView = {
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
        
        let stackArray = [diameterStackView, rotationPeriodStackView, orbitalPeriodStackView, gravityStackView, populationStackView, climateStackView, terrainStackView, surfaceWaterStackView]
        let labelArray = [[diameterLabel, diameterValueLabel],
                          [rotationPeriodLabel, rotationPeriodValueLabel],
                          [orbitalPeriodLabel, orbitalPeriodValueLabel],
                          [gravityLabel, gravityValueLabel],
                          [populationLabel, populationValueLabel],
                          [climateLabel, climateValueLabel],
                          [terrainLabel, terrainValueLabel],
                          [surfaceWaterLabel, surfaceWaterValueLabel]
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
    
    func configureWith(model: PlanetViewModel) {
        guard let image = UIImage(named: "planet") else { return }
        iconImageView.image = image
        
        nameLabel.text = model.name
        diameterValueLabel.text = model.diameter
        rotationPeriodValueLabel.text = model.rotationPeriod
        orbitalPeriodValueLabel.text = model.orbitalPeriod
        gravityValueLabel.text = model.gravity
        populationValueLabel.text = model.population
        climateValueLabel.text = model.climate
        terrainValueLabel.text = model.terrain
        surfaceWaterValueLabel.text = model.waterSurface
        
        if let _ = model.movies {
            infoStackView.addArrangedSubview(moviesButton)
        }
        
        if let _ = model.residents {
            infoStackView.addArrangedSubview(residentsButton)
        }
    }
}
