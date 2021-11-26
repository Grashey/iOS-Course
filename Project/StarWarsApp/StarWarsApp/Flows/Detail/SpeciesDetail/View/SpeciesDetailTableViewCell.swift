//
//  SpeciesDetailTableViewCell.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import UIKit

class SpeciesDetailTableViewCell: UITableViewCell {

    private enum LabelValues {
        static let classification = "Classification: "
        static let designation = "Designation: "
        static let averageHeight = "Average height: "
        static let averageLifespan = "Average lifespan: "
        static let eyeColors = "Eye colors: "
        static let hairColors = "Hair colors: "
        static let skinColors = "Skin colors: "
        static let language = "Language: "
        static let homeworld = "Homeworld: "
        static let related = "Related to: "
    }

    private let inset: CGFloat = 10
    private let smallFont = UIFont(name: Constants.Fonts.font, size: 12)
    private let bigFont = UIFont(name: Constants.Fonts.font, size: 18)
    private let titleColor: UIColor = #colorLiteral(red: 0.9089605212, green: 0.8589437604, blue: 0.3372781873, alpha: 1)

    private lazy var iconImageView: UIImageView = {
        $0.image = UIImage(named: Constants.ImageName.defaultIcon)
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

    private lazy var classificationLabel: BaseLabel = {
        $0.text = LabelValues.classification
        return $0
    }(BaseLabel())

    private lazy var designationLabel: BaseLabel = {
        $0.text = LabelValues.designation
        return $0
    }(BaseLabel())

    private lazy var averageHeightLabel: BaseLabel = {
        $0.text = LabelValues.averageHeight
        return $0
    }(BaseLabel())

    private lazy var averageLifespanLabel: BaseLabel = {
        $0.text = LabelValues.averageLifespan
        return $0
    }(BaseLabel())

    private lazy var eyeColorsLabel: BaseLabel = {
        $0.text = LabelValues.eyeColors
        return $0
    }(BaseLabel())

    private lazy var hairColorsLabel: BaseLabel = {
        $0.text = LabelValues.hairColors
        return $0
    }(BaseLabel())

    private lazy var skinColorsLabel: BaseLabel = {
        $0.text = LabelValues.skinColors
        return $0
    }(BaseLabel())

    private lazy var languageLabel: BaseLabel = {
        $0.text = LabelValues.language
        return $0
    }(BaseLabel())

    private lazy var homeworldLabel: BaseLabel = {
        $0.text = LabelValues.homeworld
        return $0
    }(BaseLabel())

    private lazy var relatedLabel: BaseLabel = {
        $0.text = LabelValues.related
        return $0
    }(BaseLabel())

    private lazy var classificationValueLabel = BaseValueLabel()
    private lazy var designationValueLabel = BaseValueLabel()
    private lazy var averageHeightValueLabel = BaseValueLabel()
    private lazy var averageLifespanValueLabel = BaseValueLabel()
    private lazy var eyeColorsValueLabel = BaseValueLabel()
    private lazy var hairColorsValueLabel = BaseValueLabel()
    private lazy var skinColorsValueLabel = BaseValueLabel()
    private lazy var languageValueLabel = BaseValueLabel()
    private lazy var homeworldValueLabel = BaseValueLabel()

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

    private lazy var classificationStackView = BaseLabelStackView()
    private lazy var designationStackView = BaseLabelStackView()
    private lazy var averageHeightStackView = BaseLabelStackView()
    private lazy var averageLifespanStackView = BaseLabelStackView()
    private lazy var eyeColorsStackView = BaseLabelStackView()
    private lazy var hairColorsStackView = BaseLabelStackView()
    private lazy var skinColorsStackView = BaseLabelStackView()
    private lazy var languageStackView = BaseLabelStackView()
    private lazy var homeworldStackView = BaseLabelStackView()

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

        let stackArray = [classificationStackView, designationStackView, averageHeightStackView, averageLifespanStackView,
                          eyeColorsStackView, hairColorsStackView, skinColorsStackView, languageStackView, homeworldStackView]
        let labelArray = [[classificationLabel, classificationValueLabel],
                          [designationLabel, designationValueLabel],
                          [averageHeightLabel, averageHeightValueLabel],
                          [averageLifespanLabel, averageLifespanValueLabel],
                          [eyeColorsLabel, eyeColorsValueLabel],
                          [hairColorsLabel, hairColorsValueLabel],
                          [skinColorsLabel, skinColorsValueLabel],
                          [languageLabel, languageValueLabel],
                          [homeworldLabel, homeworldValueLabel]
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
        eyeColorsLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        hairColorsLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        skinColorsLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
    }

    func configureWith(model: SpeciesViewModel) {
        iconImageView.image = model.image
        nameLabel.text = model.name
        classificationValueLabel.text = model.classification
        designationValueLabel.text = model.designation
        averageHeightValueLabel.text = model.averageHeight
        averageLifespanValueLabel.text = model.averageLifespan
        eyeColorsValueLabel.text = model.eyeColors
        hairColorsValueLabel.text = model.hairColors
        skinColorsValueLabel.text = model.skinColors
        languageValueLabel.text = model.language
        homeworldValueLabel.text = model.homeworld
    }
}
