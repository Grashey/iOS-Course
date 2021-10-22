//
//  EntityViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 20.10.2021.
//

import UIKit

class EntityViewController: UIViewController {
    
    var presenter: EntityPresenterProtocol?
    var onDetails: ((Entity) -> Void)?
    var onSwitchEntity: ((Entity) -> Void)?

    override func viewDidLoad() {
        addMenuButton()
        loadNewData()
       
        guard let image = UIImage(named: Constants.ImageName.backgroundImage) else { return }
        self.view.addSubview(UIImageView(image: image))
    }
    
    func loadNewData() {
        self.navigationItem.title = presenter?.getTitleName()
        presenter?.getData()
    }
    
    private func addMenuButton() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: Constants.ImageName.menuIcon),
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(showMenu))
    }
    
    @objc func showMenu(){
        showMenuVC()
    }
    
    private func showMenuVC() {
        if self.children.count > .zero {
           dismissController()
        } else {
            let menuContainerView = UIView()
            menuContainerView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(menuContainerView)
            
            NSLayoutConstraint.activate([
                menuContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                menuContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                menuContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33),
                menuContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
            
            let controller = MenuViewController()
            addChild(controller: controller, containerView: menuContainerView)
            controller.completionHandler = { [weak self] in
                self?.onSwitchEntity?($0)
            }
            
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissController))
            self.view.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    @objc func dismissController(){
        view.gestureRecognizers?.removeLast()
        guard let controller = children.last else { return }
        removeChild(controller: controller)
        view.subviews.last?.removeFromSuperview()
    }
    
    private func addChild(controller: UIViewController, containerView: UIView) {
        controller.view.frame = containerView.frame
        containerView.addSubview(controller.view)
        self.addChild(controller)
        controller.didMove(toParent: self)
    }
    
    private func removeChild(controller: UIViewController) {
        controller.willMove(toParent: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParent()
    }

}

