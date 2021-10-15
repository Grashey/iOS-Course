//
//  MyButton.swift
//  ResponderTestApp
//
//  Created by Aleksandr Fetisov on 15.10.2021.
//

import UIKit

class MyButton: UIButton {
    
    var touchAreaPadding: UIEdgeInsets?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        guard let insets = touchAreaPadding else {
            return super.point(inside: point, with: event)
        }
        
        let rect = bounds.inset(by: insets.inverted())
        return rect.contains(point)
    }
    
}

extension UIEdgeInsets {
    func inverted() -> UIEdgeInsets {
        return UIEdgeInsets(top: -top, left: -left, bottom: -bottom, right: -right)
    }
}
