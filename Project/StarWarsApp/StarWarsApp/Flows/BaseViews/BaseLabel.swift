//
//  BaseLabel.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 29.10.2021.
//

import UIKit

class BaseLabel: UILabel {

    private let smallFont = UIFont(name: Constants.Fonts.font, size: 14)
    private let labelTextColor: UIColor = .white
    private let topInset: CGFloat = 10
    private let leftInset: CGFloat = 10
    private let bottomInset: CGFloat = 10
    private let rightInset: CGFloat = 10

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = smallFont
        self.textColor = labelTextColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override public var intrinsicContentSize: CGSize {
        var intrinsicSuperViewContentSize = super.intrinsicContentSize
        intrinsicSuperViewContentSize.height += topInset + bottomInset
        intrinsicSuperViewContentSize.width += leftInset + rightInset
        return intrinsicSuperViewContentSize
    }

}
