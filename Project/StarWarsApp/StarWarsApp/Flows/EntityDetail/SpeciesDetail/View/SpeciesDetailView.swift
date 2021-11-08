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
    
    private lazy var classificationValueLabel = BaseValueLabel()
    private lazy var designationValueLabel = BaseValueLabel()
    private lazy var averageHeightValueLabel = BaseValueLabel()
    private lazy var averageLifespanValueLabel = BaseValueLabel()
    private lazy var eyeColorsValueLabel = BaseValueLabel()
    private lazy var hairColorsValueLabel = BaseValueLabel()
    private lazy var skinColorsValueLabel = BaseValueLabel()
    private lazy var languageValueLabel = BaseValueLabel()
    private lazy var homeworldValueLabel = BaseValueLabel()
    
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

    private lazy var classificationStackView = BaseLabelStackView()
    private lazy var designationStackView = BaseLabelStackView()
    private lazy var averageHeightStackView = BaseLabelStackView()
    private lazy var averageLifespanStackView = BaseLabelStackView()
    private lazy var eyeColorsStackView = BaseLabelStackView()
    private lazy var hairColorsStackView = BaseLabelStackView()
    private lazy var skinColorsStackView = BaseLabelStackView()
    private lazy var languageStackView = BaseLabelStackView()
    private lazy var homeworldStackView = BaseLabelStackView()
     
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
        
        if let _ = model.movies {
            infoStackView.addArrangedSubview(moviesButton)
        }
        
        if let _ = model.characters {
            infoStackView.addArrangedSubview(peopleButton)
        }
    }
}
