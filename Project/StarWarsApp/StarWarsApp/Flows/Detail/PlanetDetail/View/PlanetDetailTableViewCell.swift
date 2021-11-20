//
//  PlanetDetailTableViewCell.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import UIKit

class PlanetDetailTableViewCell: UITableViewCell {

    private struct LabelValues {
        static let diameter = "Diameter: "
        static let rotationPeriod = "Rotation period: "
        static let orbitalPeriod = "Orbital period: "
        static let gravity = "Gravity: "
        static let population = "Population: "
        static let climate = "Climate: "
        static let terrain = "Terrain: "
        static let surfaceWater = "Water surface: "
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

    private lazy var diameterLabel: BaseLabel = {
        $0.text = LabelValues.diameter
        return $0
    }(BaseLabel())

    private lazy var rotationPeriodLabel: BaseLabel = {
        $0.text = LabelValues.rotationPeriod
        return $0
    }(BaseLabel())

    private lazy var orbitalPeriodLabel: BaseLabel = {
        $0.text = LabelValues.orbitalPeriod
        return $0
    }(BaseLabel())

    private lazy var gravityLabel: BaseLabel = {
        $0.text = LabelValues.gravity
        return $0
    }(BaseLabel())

    private lazy var populationLabel: BaseLabel = {
        $0.text = LabelValues.population
        return $0
    }(BaseLabel())

    private lazy var climateLabel: BaseLabel = {
        $0.text = LabelValues.climate
        return $0
    }(BaseLabel())

    private lazy var terrainLabel: BaseLabel = {
        $0.text = LabelValues.terrain
        return $0
    }(BaseLabel())

    private lazy var surfaceWaterLabel: BaseLabel = {
        $0.text = LabelValues.surfaceWater
        return $0
    }(BaseLabel())

    private lazy var relatedLabel: BaseLabel = {
        $0.text = LabelValues.related
        return $0
    }(BaseLabel())

    private lazy var diameterValueLabel = BaseValueLabel()
    private lazy var rotationPeriodValueLabel = BaseValueLabel()
    private lazy var orbitalPeriodValueLabel = BaseValueLabel()
    private lazy var gravityValueLabel = BaseValueLabel()
    private lazy var populationValueLabel = BaseValueLabel()
    private lazy var climateValueLabel = BaseValueLabel()
    private lazy var terrainValueLabel = BaseValueLabel()
    private lazy var surfaceWaterValueLabel = BaseValueLabel()

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

    private lazy var diameterStackView = BaseLabelStackView()
    private lazy var rotationPeriodStackView = BaseLabelStackView()
    private lazy var orbitalPeriodStackView = BaseLabelStackView()
    private lazy var gravityStackView = BaseLabelStackView()
    private lazy var populationStackView = BaseLabelStackView()
    private lazy var climateStackView = BaseLabelStackView()
    private lazy var terrainStackView = BaseLabelStackView()
    private lazy var surfaceWaterStackView = BaseLabelStackView()

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

        let stackArray = [diameterStackView, rotationPeriodStackView, orbitalPeriodStackView,
                          gravityStackView, populationStackView, climateStackView, terrainStackView, surfaceWaterStackView]
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
        gravityLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
    }

    func configureWith(model: PlanetViewModel) {
        iconImageView.image = model.image
        nameLabel.text = model.name
        diameterValueLabel.text = model.diameter.formattedWithSeparator
        rotationPeriodValueLabel.text = model.rotationPeriod
        orbitalPeriodValueLabel.text = model.orbitalPeriod.formattedWithSeparator
        gravityValueLabel.text = model.gravity
        populationValueLabel.text = model.population.formattedWithSeparator
        climateValueLabel.text = model.climate
        terrainValueLabel.text = model.terrain
        surfaceWaterValueLabel.text = model.waterSurface.formattedWithPercent
    }
}
