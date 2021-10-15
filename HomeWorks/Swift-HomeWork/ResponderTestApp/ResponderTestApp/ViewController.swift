//
//  ViewController.swift
//  ResponderTestApp
//
//  Created by Aleksandr Fetisov on 14.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let diameter: CGFloat = 200
    let originX: CGFloat = 100
    let originY: CGFloat = 100
    
    var button = MyButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addCircles()
        addButton()
    }
    
    func addCircles() {
        let view1 = MyView(frame: CGRect(x: originX, y: originY, width: diameter, height: diameter))
        view1.layer.masksToBounds = true
        view1.layer.cornerRadius = diameter/2
        view1.backgroundColor = .red
        view.addSubview(view1)
        
        let view2 = UIView(frame: CGRect(x: originX/2, y: originY/2, width: diameter/2, height: diameter/2))
        view2.backgroundColor = .yellow
        view2.layer.masksToBounds = true
        view2.layer.cornerRadius = diameter/4
        view1.addSubview(view2)
        
        let layer1 = CALayer()
        layer1.frame = CGRect(x: diameter/2 - diameter/8, y: diameter/2 - diameter/8, width: diameter/4, height: diameter/4)
        layer1.masksToBounds = true
        layer1.cornerRadius = diameter/8
        layer1.backgroundColor = UIColor.green.cgColor
        view1.layer.addSublayer(layer1)
    }
    
    func addButton() {
        button = MyButton(frame: CGRect(x: view.frame.width/2 - 50, y: view.frame.height/2, width: 100, height: 30))
        button.touchAreaPadding = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        button.backgroundColor = .orange
        button.setTitle("Press me", for: .normal)
        button.addTarget(self, action: #selector(toggleColor), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func toggleColor() {
        if button.backgroundColor == .orange {
            button.backgroundColor = .cyan
        } else {
            button.backgroundColor = .orange
        }
    }
}
