//
//  MyView.swift
//  ResponderTestApp
//
//  Created by Aleksandr Fetisov on 14.10.2021.
//

import UIKit

class MyView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let cutedRect = self.layer.sublayers?.last?.frame else { return UIView() }
        if cutedRect.contains(point) {
            guard let colorName = self.backgroundColor?.description else { return UIView() }
            print (colorName)
            return self
        } else {
            let view = super.hitTest(point, with: event)
            guard let colorName = view?.backgroundColor?.description else { return UIView() }
            print (colorName)
            return view
        }
    }
}
