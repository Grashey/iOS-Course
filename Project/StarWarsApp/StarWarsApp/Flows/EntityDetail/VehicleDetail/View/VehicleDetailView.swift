//
//  VehicleDetailView.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 29.10.2021.
//

import UIKit

class VehicleDetailView: UIView {
    
    private struct LabelValues {
        static let model = "Model: "
        static let vehicleClass = "Vehicle class: "
        static let manufacturer = "Manufacturer: "
        static let costInCredits = "Cost in credits: "
        static let length = "Length: "
        static let crew = "Crew: "
        static let passengers = "Passengers capacity: "
        static let maxAtmospheringSpeed = "Max. atmosphering speed: "
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
    
    private lazy var modelLabel: BaseLabel = {
        $0.text = LabelValues.model
        return $0
    }(BaseLabel())
    
    private lazy var vehicleClassLabel: BaseLabel = {
        $0.text = LabelValues.vehicleClass
        return $0
    }(BaseLabel())
    
    private lazy var manufacturerLabel: BaseLabel = {
        $0.text = LabelValues.manufacturer
        return $0
    }(BaseLabel())
    
    private lazy var costInCreditsLabel: BaseLabel = {
        $0.text = LabelValues.costInCredits
        return $0
    }(BaseLabel())
    
    private lazy var lengthLabel: BaseLabel = {
        $0.text = LabelValues.length
        return $0
    }(BaseLabel())
    
    private lazy var crewLabel: BaseLabel = {
        $0.text = LabelValues.crew
        return $0
    }(BaseLabel())
    
    private lazy var passengersLabel: BaseLabel = {
        $0.text = LabelValues.passengers
        return $0
    }(BaseLabel())
    
    private lazy var cargoCapacityLabel: BaseLabel = {
        $0.text = LabelValues.cargoCapacity
        return $0
    }(BaseLabel())
    
    private lazy var maxAtmospheringSpeedLabel: BaseLabel = {
        $0.text = LabelValues.maxAtmospheringSpeed
        return $0
    }(BaseLabel())
    
    private lazy var consumablesLabel: BaseLabel = {
        $0.text = LabelValues.consumables
        return $0
    }(BaseLabel())
    
    private lazy var modelValueLabel = BaseValueLabel()
    private lazy var vehicleClassValueLabel = BaseValueLabel()
    private lazy var manufacturerValueLabel = BaseValueLabel()
    private lazy var costInCreditsValueLabel = BaseValueLabel()
    private lazy var lengthValueLabel = BaseValueLabel()
    private lazy var crewValueLabel = BaseValueLabel()
    private lazy var passengersValueLabel = BaseValueLabel()
    private lazy var cargoCapacityValueLabel = BaseValueLabel()
    private lazy var maxAtmospheringSpeedValueLabel = BaseValueLabel()
    private lazy var consumablesValueLabel = BaseValueLabel()
    
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

    private lazy var modelStackView = BaseLabelStackView()
    private lazy var vehicleClassStackView = BaseLabelStackView()
    private lazy var manufacturerStackView = BaseLabelStackView()
    private lazy var costInCreditsStackView = BaseLabelStackView()
    private lazy var lengthStackView = BaseLabelStackView()
    private lazy var crewStackView = BaseLabelStackView()
    private lazy var passengersStackView = BaseLabelStackView()
    private lazy var cargoCapacityStackView = BaseLabelStackView()
    private lazy var maxAtmospheringSpeedStackView = BaseLabelStackView()
    private lazy var consumablesStackView = BaseLabelStackView()
     
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
        
        let stackArray = [modelStackView, vehicleClassStackView, manufacturerStackView, costInCreditsStackView, lengthStackView, crewStackView, passengersStackView, cargoCapacityStackView, maxAtmospheringSpeedStackView, consumablesStackView]
        let labelArray = [[modelLabel, modelValueLabel],
                          [vehicleClassLabel, vehicleClassValueLabel],
                          [manufacturerLabel, manufacturerValueLabel],
                          [costInCreditsLabel, costInCreditsValueLabel],
                          [lengthLabel, lengthValueLabel],
                          [crewLabel, crewValueLabel],
                          [passengersLabel, passengersValueLabel],
                          [cargoCapacityLabel, cargoCapacityValueLabel],
                          [maxAtmospheringSpeedLabel, maxAtmospheringSpeedValueLabel],
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
    
    func configureWith(model: VehicleViewModel) {
        iconImageView.image = model.image
        
        nameLabel.text = model.name
        modelValueLabel.text = model.model
        vehicleClassValueLabel.text = model.vehicleClass
        manufacturerValueLabel.text = model.manufacturer
        costInCreditsValueLabel.text = model.costInCredits
        lengthValueLabel.text = model.length
        crewValueLabel.text = model.crew
        passengersValueLabel.text = model.passengers
        cargoCapacityValueLabel.text = model.cargoCapacity
        maxAtmospheringSpeedValueLabel.text = model.maxAtmospheringSpeed
        consumablesValueLabel.text = model.consumables
        
        if let _ = model.movies {
            infoStackView.addArrangedSubview(moviesButton)
        }
        
        if let _ = model.pilots {
            infoStackView.addArrangedSubview(pilotsButton)
        }
    }
}
