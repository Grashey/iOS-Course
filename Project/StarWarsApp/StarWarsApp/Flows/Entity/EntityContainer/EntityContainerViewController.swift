//
//  EntityContainerViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.11.2021.
//

import UIKit

class EntityContainerViewController: UIViewController {

    private lazy var menuContainerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    private var entity: EntityRoute = .characters
    private lazy var menuVC = MenuViewController()
    private var menuIsShown: Bool = false
    var onEntity: ((EntityRoute) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        addMenuButton()
        switchVC()
    }

    private func switchVC() {
        navigationItem.title = getTitleName()
        onEntity?(entity)
    }

    private func addMenuButton() {
        let side: CGFloat = 45
        let button = UIButton(type: .custom)
        let image = UIImage(named: Constants.ImageName.menuIcon)
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
        button.frame = CGRect(x: .zero, y: .zero, width: side, height: side)

        let view = UIView(frame: CGRect(x: .zero, y: .zero, width: side, height: side))
        view.bounds = view.bounds.offsetBy(dx: 10, dy: 3)
        view.addSubview(button)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: view)
    }

    @objc private func showMenu() {
        if !menuIsShown {
            showMenuController()
        } else {
            dismissMenuController()
        }
    }

    @objc private func dismissMenuController() {
        view.gestureRecognizers?.removeLast()
        menuVC.willMove(toParent: nil)
        menuVC.view.removeFromSuperview()
        menuVC.removeFromParent()
        menuContainerView.removeFromSuperview()
        menuIsShown = false
    }

    private func showMenuController() {
        view.addSubview(menuContainerView)
        menuContainerView.addSubview(menuVC.view)
        addChild(menuVC)
        menuVC.didMove(toParent: self)

        NSLayoutConstraint.activate([
            menuContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33),
            menuContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        menuVC.completionHandler = { [weak self] in
            guard let self = self, self.entity != $0 else { return }
            self.entity = $0
            self.dismissMenuController()
            self.switchVC()
        }

        menuIsShown = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMenuController))
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    private func getTitleName() -> String {
        switch entity {
        case .characters: return Constants.Entity.characters
        case .planets: return Constants.Entity.planets
        case .species: return Constants.Entity.species
        case .starships: return Constants.Entity.starships
        case .vehicles: return Constants.Entity.vehicles
        }
    }

}
