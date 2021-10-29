//
//  BaseLabel.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 29.10.2021.
//

import UIKit

class BaseLabel: UILabel {

    private let smallFont = UIFont(name: Constants.Fonts.font, size: 12)
    private let labelTextColor: UIColor = .white
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = smallFont
        self.textColor = labelTextColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
