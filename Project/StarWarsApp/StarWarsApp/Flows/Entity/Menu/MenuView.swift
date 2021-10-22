//
//  MenuView.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 22.10.2021.
//

import UIKit

class MenuView: UIView {

    let inset: CGFloat = 10
    
    let font = UIFont(name: Constants.Fonts.font, size: 16)

    lazy var charactersButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = font
        button.setTitleColor(.yellow, for: .normal)
        button.setTitle(Constants.Entity.characters, for: .normal)
        return button
    }()
    
    lazy var planetsButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = font
        button.setTitleColor(.yellow, for: .normal)
        button.setTitle(Constants.Entity.planets, for: .normal)
        return button
    }()
    
    lazy var speciesButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = font
        button.setTitleColor(.yellow, for: .normal)
        button.setTitle(Constants.Entity.species, for: .normal)
        return button
    }()
    
    lazy var starshipsButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = font
        button.setTitleColor(.yellow, for: .normal)
        button.setTitle(Constants.Entity.starships, for: .normal)
        return button
    }()
    
    lazy var vehiclesButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = font
        button.setTitleColor(.yellow, for: .normal)
        button.setTitle(Constants.Entity.vehicles, for: .normal)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.distribution = .fillProportionally
        stackview.alignment = .top
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        self.isOpaque = false
        self.alpha = 0.4
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(stackView)
        let buttonsArray = [charactersButton, planetsButton, speciesButton, starshipsButton, vehiclesButton]
        buttonsArray.forEach { stackView.addArrangedSubview($0) }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: inset),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset),
            stackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.33)
        ])
    }

}
