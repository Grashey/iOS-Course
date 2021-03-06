//
//  CharacterDetailTableViewCell.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 11.11.2021.
//

import UIKit

class CharacterDetailTableViewCell: UITableViewCell {

    private enum LabelValues {
        static let birthYear = "Birth year: "
        static let gender = "Gender: "
        static let hairColor = "Hair color: "
        static let eyeColor = "Eye color: "
        static let skinColor = "Skin color: "
        static let height = "Height: "
        static let weight = "Weight: "
        static let homeworld = "Homeworld: "
        static let related = "Related to: "
    }

    private let inset: CGFloat = 10
    private let smallFont = UIFont(name: Constants.Fonts.main, size: 12)
    private let bigFont = UIFont(name: Constants.Fonts.main, size: 18)
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

    private lazy var birthYearLabel: BaseLabel = {
        $0.text = LabelValues.birthYear
        return $0
    }(BaseLabel())

    private lazy var genderLabel: BaseLabel = {
        $0.text = LabelValues.gender
        return $0
    }(BaseLabel())

    private lazy var hairColorLabel: BaseLabel = {
        $0.text = LabelValues.hairColor
        return $0
    }(BaseLabel())

    private lazy var eyeColorLabel: BaseLabel = {
        $0.text = LabelValues.eyeColor
        return $0
    }(BaseLabel())

    private lazy var skinColorLabel: BaseLabel = {
        $0.text = LabelValues.skinColor
        return $0
    }(BaseLabel())

    private lazy var heightLabel: BaseLabel = {
        $0.text = LabelValues.height
        return $0
    }(BaseLabel())

    private lazy var weightLabel: BaseLabel = {
        $0.text = LabelValues.weight
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

    private lazy var birthYearValueLabel = BaseValueLabel()
    private lazy var genderValueLabel = BaseValueLabel()
    private lazy var hairColorValueLabel = BaseValueLabel()
    private lazy var eyeColorValueLabel = BaseValueLabel()
    private lazy var skinColorValueLabel = BaseValueLabel()
    private lazy var heightValueLabel = BaseValueLabel()
    private lazy var weightValueLabel = BaseValueLabel()
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
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private lazy var birthYearStackView = BaseLabelStackView()
    private lazy var genderStackView = BaseLabelStackView()
    private lazy var hairColorStackView = BaseLabelStackView()
    private lazy var eyeColorStackView = BaseLabelStackView()
    private lazy var skinColorStackView = BaseLabelStackView()
    private lazy var heightStackView = BaseLabelStackView()
    private lazy var weightStackView = BaseLabelStackView()
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

        let stackArray = [birthYearStackView, genderStackView, hairColorStackView, eyeColorStackView,
                          skinColorStackView, heightStackView, weightStackView, homeworldStackView]
        let labelArray = [[birthYearLabel, birthYearValueLabel],
                          [genderLabel, genderValueLabel],
                          [hairColorLabel, hairColorValueLabel],
                          [eyeColorLabel, eyeColorValueLabel],
                          [skinColorLabel, skinColorValueLabel],
                          [heightLabel, heightValueLabel],
                          [weightLabel, weightValueLabel],
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
        NSLayoutConstraint.activate( [
            contentStackView.topAnchor.constraint(equalTo: self.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            infoStackView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }

    func configureWith(model: CharacterViewModel) {
        iconImageView.image = model.image
        nameLabel.text = model.name
        birthYearValueLabel.text = model.birthYear
        genderValueLabel.text = model.gender
        hairColorValueLabel.text = model.hairColor
        eyeColorValueLabel.text = model.eyeColor
        skinColorValueLabel.text = model.skinColor
        heightValueLabel.text = model.height
        weightValueLabel.text = model.mass
        homeworldValueLabel.text = model.homeworld
    }
}
