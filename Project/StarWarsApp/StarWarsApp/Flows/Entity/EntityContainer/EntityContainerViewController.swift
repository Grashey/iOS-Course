//
//  EntityContainerViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.11.2021.
//

import UIKit

class EntityContainerViewController: UIViewController {

    private lazy var menuContainerView = UIView()
    private var entity: EntityRoute = .characters
    private var childVC: UIViewController?
    private lazy var menuVC = MenuViewController()
    private var menuIsShown: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        addMenuButton()
        switchVC()
    }

    private func switchVC() {
        navigationItem.title = getTitleName()
        if let child = childVC {
            removeChild(controller: child)
        }
        switch entity {
        case .characters: makeVC(assembler: CharacterViewControllerAssembler())
        case .planets: makeVC(assembler: PlanetViewControllerAssembler())
        case .species: makeVC(assembler: SpeciesViewControllerAssembler())
        case .starships: makeVC(assembler: StarshipViewControllerAssembler())
        case .vehicles: makeVC(assembler: VehicleViewControllerAssembler())
        }
    }

    private func makeVC(assembler: ViewControllerAssemblerProtocol) {
        childVC = assembler.create() as? EntityViewController
        guard let child = childVC else { return }
        child.view.frame = view.frame
        addChild(controller: child, containerView: view)
    }

    private func addMenuButton() {
        let side: CGFloat = 45
        let button = UIButton(type: .custom)
        let image = UIImage(named: Constants.ImageName.menuIcon)
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: side, height: side)

        let view = UIView(frame: CGRect(x: 0, y: 0, width: side, height: side))
        view.bounds = view.bounds.offsetBy(dx: 10, dy: 3)
        view.addSubview(button)
        let menuButton = UIBarButtonItem(customView: view)
        navigationItem.leftBarButtonItem = menuButton
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
        removeChild(controller: menuVC)
        menuContainerView.removeFromSuperview()
        menuIsShown = false
    }

    private func showMenuController() {
        // TODO: написать custom presentation controller
        menuContainerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(menuContainerView)

        NSLayoutConstraint.activate([
            menuContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33),
            menuContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        addChild(controller: menuVC, containerView: menuContainerView)
        menuVC.completionHandler = { [weak self] in
            guard let self = self, self.entity != $0 else { return }
            self.entity = $0
            self.switchVC()
            self.dismissMenuController()
        }

        menuIsShown = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMenuController))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }

    private func addChild(controller: UIViewController, containerView: UIView) {
        containerView.addSubview(controller.view)
        self.addChild(controller)
        controller.didMove(toParent: self)
    }

    private func removeChild(controller: UIViewController) {
        controller.willMove(toParent: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParent()
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
