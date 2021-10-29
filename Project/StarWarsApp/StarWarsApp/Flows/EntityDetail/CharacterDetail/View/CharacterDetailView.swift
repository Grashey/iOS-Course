//
//  CharacterDetailView.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 27.10.2021.
//

import UIKit

class CharacterDetailView: UIView {
    
    private struct LabelValues {
        static let birthYear = "Birth year: "
        static let gender = "Gender: "
        static let hairColor = "Hair color: "
        static let eyeColor = "Eye color: "
        static let skinColor = "Skin color: "
        static let height = "Height: "
        static let weight = "Weight: "
        static let homeworld = "Homeworld: "
    }
    
    private struct ButtonLabelValues {
        static let movies = "Appearances in the movies"
        static let species = "Belongs to the species"
        static let starships = "Pilots starships"
        static let vehicles = "Drives vehicles"
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
    
    private lazy var birthYearValueLabel = BaseValueLabel()
    private lazy var genderValueLabel = BaseValueLabel()
    private lazy var hairColorValueLabel = BaseValueLabel()
    private lazy var eyeColorValueLabel = BaseValueLabel()
    private lazy var skinColorValueLabel = BaseValueLabel()
    private lazy var heightValueLabel = BaseValueLabel()
    private lazy var weightValueLabel = BaseValueLabel()
    private lazy var homeworldValueLabel = BaseValueLabel()
    
    lazy var moviesButton: UIButton = {
        $0.titleLabel?.font = smallFont
        $0.setTitleColor(titleColor, for: .normal)
        $0.setTitle(ButtonLabelValues.movies, for: .normal)
        return $0
    }(UIButton())
    
    lazy var speciesButton: UIButton = {
        $0.titleLabel?.font = smallFont
        $0.setTitleColor(titleColor, for: .normal)
        $0.setTitle(ButtonLabelValues.species, for: .normal)
        return $0
    }(UIButton())
    
    lazy var starshipsButton: UIButton = {
        $0.titleLabel?.font = smallFont
        $0.setTitleColor(titleColor, for: .normal)
        $0.setTitle(ButtonLabelValues.starships, for: .normal)
        return $0
    }(UIButton())
    
    lazy var vehiclesButton: UIButton = {
        $0.titleLabel?.font = smallFont
        $0.setTitleColor(titleColor, for: .normal)
        $0.setTitle(ButtonLabelValues.vehicles, for: .normal)
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

    private lazy var birthYearStackView = BaseLabelStackView()
    private lazy var genderStackView = BaseLabelStackView()
    private lazy var hairColorStackView = BaseLabelStackView()
    private lazy var eyeColorStackView = BaseLabelStackView()
    private lazy var skinColorStackView = BaseLabelStackView()
    private lazy var heightStackView = BaseLabelStackView()
    private lazy var weightStackView = BaseLabelStackView()
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
        
        let stackArray = [birthYearStackView, genderStackView, hairColorStackView, eyeColorStackView, skinColorStackView, heightStackView, weightStackView, homeworldStackView]
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
    
    func configureWith(model: CharacterViewModel) {
        guard let image = UIImage(named: "iconCharacters") else { return }
        iconImageView.image = image
        
        nameLabel.text = model.name
        birthYearValueLabel.text = model.birthYear
        genderValueLabel.text = model.gender
        hairColorValueLabel.text = model.hairColor
        eyeColorValueLabel.text = model.eyeColor
        skinColorValueLabel.text = model.skinColor
        heightValueLabel.text = model.height
        weightValueLabel.text = model.mass
        homeworldValueLabel.text = model.homeworld
        
        if let _ = model.movies {
            infoStackView.addArrangedSubview(moviesButton)
        }
        
        if let _ = model.species {
            infoStackView.addArrangedSubview(speciesButton)
        }
        
        if let _ = model.starships {
            infoStackView.addArrangedSubview(starshipsButton)
        }
        
        if let _ = model.vehicles {
            infoStackView.addArrangedSubview(vehiclesButton)
        }
    }
}
