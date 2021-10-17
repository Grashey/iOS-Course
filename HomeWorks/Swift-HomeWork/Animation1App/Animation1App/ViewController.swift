//
//  ViewController.swift
//  Animation1App
//
//  Created by Aleksandr Fetisov on 17.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var containerView: UIView = {
        let view = UIView()
        let width: CGFloat = 200
        let height: CGFloat = 30
        view.frame = CGRect(x: self.view.frame.width/2 - width/2, y: self.view.frame.height/2 - height/2, width: width, height: height)
        view.clipsToBounds = true
        return view
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        let width: CGFloat = 100
        let height: CGFloat = 30
        let offset: CGFloat = 50
        button.frame = CGRect(x: view.frame.width/2 - width/2, y: view.frame.height/2 + offset - height/2, width: width, height: height)
        button.setTitle("Press me", for: .normal)
        button.addTarget(self, action: #selector(startAnimation), for: .touchUpInside)
        button.backgroundColor = .orange
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(containerView)
        view.addSubview(button)
        
        drawWhiteRectangle()
    }
    
    func drawWhiteRectangle() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: containerView.bounds.origin.x, y: containerView.bounds.origin.y))
        path.addLine(to: CGPoint(x: containerView.bounds.width, y: containerView.bounds.origin.y))
        path.addLine(to: CGPoint(x: containerView.bounds.width, y: containerView.bounds.height))
        path.addLine(to: CGPoint(x: containerView.bounds.origin.x, y: containerView.bounds.height))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1
        
        containerView.layer.addSublayer(shapeLayer)
    }
    
    func drawRedRectangle() -> CAShapeLayer {
        let offset: CGFloat = 5
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: containerView.bounds.origin.x, y: containerView.bounds.origin.y + offset))
        path.addLine(to: CGPoint(x: containerView.bounds.width, y: containerView.bounds.origin.y + offset))
        path.addLine(to: CGPoint(x: containerView.bounds.width, y: containerView.bounds.height - offset))
        path.addLine(to: CGPoint(x: containerView.bounds.origin.x, y: containerView.bounds.height - offset))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        
        return shapeLayer
    }
    
    func loadAnimation() {
        if containerView.layer.sublayers?.count ?? .zero > 1 {
            containerView.layer.sublayers?.removeLast()
        }
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 2
        animation.fromValue = CGPoint(x: -containerView.frame.width, y: 0)
        animation.toValue = CGPoint(x: 0, y: 0)
        
        let newLayer = drawRedRectangle()
        containerView.layer.addSublayer(newLayer)
        
        newLayer.add(animation, forKey: "position")
    }
    
    @objc func startAnimation() {
        loadAnimation()
    }
}

