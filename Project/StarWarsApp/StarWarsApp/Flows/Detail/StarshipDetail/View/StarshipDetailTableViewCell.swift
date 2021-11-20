//
//  StarshipDetailTableViewCell.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import UIKit

class StarshipDetailTableViewCell: UITableViewCell {

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
        static let related = "Related to: "
    }

    private let inset: CGFloat = 10
    private let smallFont = UIFont(name: Constants.Fonts.font, size: 12)
    private let bigFont = UIFont(name: Constants.Fonts.font, size: 18)
    private let titleColor: UIColor = #colorLiteral(red: 0.9089605212, green: 0.8589437604, blue: 0.3372781873, alpha: 1)

    private lazy var iconImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    private lazy var nameLabel: UILabel = {
        $0.font = bigFont
        $0.textColor = #colorLiteral(red: 0.9089605212, green: 0.8589437604, blue: 0.3372781873, alpha: 1)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())

    private lazy var modelLabel: BaseLabel = {
        $0.text = LabelValues.model
        return $0
    }(BaseLabel())

    private lazy var starshipClassLabel: BaseLabel = {
        $0.text = LabelValues.starshipClass
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

    private lazy var hyperdriveRatingLabel: BaseLabel = {
        $0.text = LabelValues.hyperdriveRating
        return $0
    }(BaseLabel())

    private lazy var maxNumberOfMegalightsLabel: BaseLabel = {
        $0.text = LabelValues.maxNumberOfMegalights
        return $0
    }(BaseLabel())

    private lazy var consumablesLabel: BaseLabel = {
        $0.text = LabelValues.consumables
        return $0
    }(BaseLabel())

    private lazy var relatedLabel: BaseLabel = {
        $0.text = LabelValues.related
        return $0
    }(BaseLabel())

    private lazy var modelValueLabel = BaseValueLabel()
    private lazy var starshipClassValueLabel = BaseValueLabel()
    private lazy var manufacturerValueLabel = BaseValueLabel()
    private lazy var costInCreditsValueLabel = BaseValueLabel()
    private lazy var lengthValueLabel = BaseValueLabel()
    private lazy var crewValueLabel = BaseValueLabel()
    private lazy var passengersValueLabel = BaseValueLabel()
    private lazy var cargoCapacityValueLabel = BaseValueLabel()
    private lazy var maxAtmospheringSpeedValueLabel = BaseValueLabel()
    private lazy var hyperdriveRatingValueLabel = BaseValueLabel()
    private lazy var maxNumberOfMegalightsValueLabel = BaseValueLabel()
    private lazy var consumablesValueLabel = BaseValueLabel()

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
    private lazy var starshipClassStackView = BaseLabelStackView()
    private lazy var manufacturerStackView = BaseLabelStackView()
    private lazy var costInCreditsStackView = BaseLabelStackView()
    private lazy var lengthStackView = BaseLabelStackView()
    private lazy var crewStackView = BaseLabelStackView()
    private lazy var passengersStackView = BaseLabelStackView()
    private lazy var cargoCapacityStackView = BaseLabelStackView()
    private lazy var maxAtmospheringSpeedStackView = BaseLabelStackView()
    private lazy var hyperdriveRatingStackView = BaseLabelStackView()
    private lazy var maxNumberOfMegalightsStackView = BaseLabelStackView()
    private lazy var consumablesStackView = BaseLabelStackView()

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

        contentStackView.addArrangedSubview(iconImageView)
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(infoStackView)

        let stackArray = [modelStackView, starshipClassStackView, manufacturerStackView, costInCreditsStackView,
                          lengthStackView, crewStackView, passengersStackView, cargoCapacityStackView, maxAtmospheringSpeedStackView,
                          hyperdriveRatingStackView, maxNumberOfMegalightsStackView, consumablesStackView]
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
        infoStackView.addArrangedSubview(relatedLabel)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: self.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            infoStackView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
        modelLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        starshipClassLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        manufacturerLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
    }

    func configureWith(model: StarshipViewModel) {
        iconImageView.image = model.image
        nameLabel.text = model.name
        modelValueLabel.text = model.model
        starshipClassValueLabel.text = model.starshipClass
        manufacturerValueLabel.text = model.manufacturer
        costInCreditsValueLabel.text = model.costInCredits.formattedWithSeparator
        lengthValueLabel.text = model.length.formattedWithSeparator
        crewValueLabel.text = model.crew.formattedWithSeparator
        passengersValueLabel.text = model.passengers.formattedWithSeparator
        cargoCapacityValueLabel.text = model.cargoCapacity.formattedWithSeparator
        maxAtmospheringSpeedValueLabel.text = model.maxAtmospheringSpeed.formattedWithSeparator
        hyperdriveRatingValueLabel.text = model.hyperdriveRating
        maxNumberOfMegalightsValueLabel.text = model.maxNumberOfMegalights
        consumablesValueLabel.text = model.consumables
    }
}
