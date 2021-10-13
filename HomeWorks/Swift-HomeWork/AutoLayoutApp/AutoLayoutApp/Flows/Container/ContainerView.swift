//
//  ContainerView.swift
//  AutoLayoutApp
//
//  Created by Aleksandr Fetisov on 12.10.2021.
//

import UIKit

class ContainerView: UIStackView {
    
    lazy var genreView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var movieView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var movieDescriptionView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var movieStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
        self.spacing = 10
        addSubviews()
        addConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addArrangedSubview(genreView)
        self.addArrangedSubview(movieStackView)
        movieStackView.addArrangedSubview(movieView)
        movieStackView.addArrangedSubview(movieDescriptionView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            genreView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4),

            movieView.topAnchor.constraint(equalTo: movieStackView.topAnchor),
            movieDescriptionView.topAnchor.constraint(equalTo: movieView.bottomAnchor),
            movieDescriptionView.bottomAnchor.constraint(equalTo: movieStackView.bottomAnchor),
            movieDescriptionView.leadingAnchor.constraint(equalTo: movieStackView.leadingAnchor),
            movieDescriptionView.trailingAnchor.constraint(equalTo: movieStackView.trailingAnchor)
        ])
    }
    
}
