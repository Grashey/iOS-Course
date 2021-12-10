//
//  MenuView.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 22.10.2021.
//

import UIKit

class MenuView: UIView {

    private let inset: CGFloat = 10
    private let font = UIFont(name: Constants.Fonts.main, size: 16)
    private let titleColor: UIColor = .yellow

    lazy var charactersButton: UIButton = {
        $0.titleLabel?.font = font
        $0.setTitleColor(titleColor, for: .normal)
        $0.setTitle(Constants.Entity.characters, for: .normal)
        return $0
    }(UIButton())

    lazy var planetsButton: UIButton = {
        $0.titleLabel?.font = font
        $0.setTitleColor(titleColor, for: .normal)
        $0.setTitle(Constants.Entity.planets, for: .normal)
        return $0
    }(UIButton())

    lazy var speciesButton: UIButton = {
        $0.titleLabel?.font = font
        $0.setTitleColor(titleColor, for: .normal)
        $0.setTitle(Constants.Entity.species, for: .normal)
        return $0
    }(UIButton())

    lazy var starshipsButton: UIButton = {
        $0.titleLabel?.font = font
        $0.setTitleColor(titleColor, for: .normal)
        $0.setTitle(Constants.Entity.starships, for: .normal)
        return $0
    }(UIButton())

    lazy var vehiclesButton: UIButton = {
        $0.titleLabel?.font = font
        $0.setTitleColor(titleColor, for: .normal)
        $0.setTitle(Constants.Entity.vehicles, for: .normal)
        return $0
    }(UIButton())

    private lazy var stackView: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.alignment = .leading
        $0.spacing = inset
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isOpaque = false
        self.alpha = 0.8
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
            stackView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }

}
