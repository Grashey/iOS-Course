//
//  SpeciesDetailView.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import UIKit

class SpeciesDetailView: UIView {
    
    private struct LabelValues {
        static let classification = "Classification: "
        static let designation = "Designation: "
        static let averageHeight = "Average height: "
        static let averageLifespan = "Average lifespan: "
        static let eyeColors = "Eye colors: "
        static let hairColors = "Hair colors: "
        static let skinColors = "Skin colors: "
        static let language = "Language: "
        static let homeworld = "Homeworld: "
    }
    
    private struct ButtonLabelValues {
        static let movies = "Appearances in the movies"
        static let people = "People"
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
    
    private lazy var classificationLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.classification
        return $0
    }(UILabel())
    
    private lazy var classificationValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var designationLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.designation
        return $0
    }(UILabel())
    
    private lazy var designationValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var averageHeightLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.averageHeight
        return $0
    }(UILabel())
    
    private lazy var averageHeightValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var averageLifespanLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.averageLifespan
        return $0
    }(UILabel())
    
    private lazy var averageLifespanValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var eyeColorsLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.eyeColors
        return $0
    }(UILabel())
    
    private lazy var eyeColorsValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var hairColorsLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.hairColors
        return $0
    }(UILabel())
    
    private lazy var hairColorsValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var skinColorsLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.skinColors
        return $0
    }(UILabel())
    
    private lazy var skinColorsValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var languageLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.language
        return $0
    }(UILabel())
    
    private lazy var languageValueLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        return $0
    }(UILabel())
    
    private lazy var homeworldLabel: UILabel = {
        $0.font = smallFont
        $0.textColor = labelTextColor
        $0.text = LabelValues.homeworld
        return $0
    }(UILabel())
    
    private lazy var homeworldValueLabel: UILabel = {
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
    
    lazy var peopleButton: UIButton = {
        $0.titleLabel?.font = smallFont
        $0.setTitleColor(titleColor, for: .normal)
        $0.setTitle(ButtonLabelValues.people, for: .normal)
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

    private lazy var classificationStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var designationStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var averageHeightStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var averageLifespanStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var eyeColorsStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var hairColorsStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var skinColorsStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var languageStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var homeworldStackView: UIStackView = {
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
        
        let stackArray = [classificationStackView, designationStackView, averageHeightStackView, averageLifespanStackView, eyeColorsStackView, hairColorsStackView, skinColorsStackView, languageStackView, homeworldStackView]
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
    
    func configureWith(model: SpeciesViewModel) {
        guard let image = UIImage(named: "iconSpecies") else { return }
        iconImageView.image = image
        
        nameLabel.text = model.name
        classificationValueLabel.text = model.classification
        designationValueLabel.text = model.designation
        averageHeightValueLabel.text = model.averageHeight
        averageLifespanValueLabel.text = model.averageLifespan
        eyeColorsValueLabel.text = model.eyeColors
        hairColorsValueLabel.text = model.hairColors
        skinColorsValueLabel.text = model.skinColors
        languageValueLabel.text = model.language
        homeworldValueLabel.text = model.homeworld // тут приходит урл
        
        if let _ = model.movies {
            infoStackView.addArrangedSubview(moviesButton)
        }
        
        if let _ = model.characters {
            infoStackView.addArrangedSubview(peopleButton)
        }
    }
}
