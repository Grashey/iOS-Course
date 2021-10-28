//
//  EntityViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 20.10.2021.
//

import UIKit

class EntityViewController: UIViewController {
    
    var presenter: EntityPresenterProtocol?
    var onDetails: ((Entity, String) -> Void)?
    var onSwitchEntity: ((Entity) -> Void)?
    
    lazy var collectionView = EntityCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    lazy var menuContainerView = UIView()
    
    override func loadView() {
        view = collectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        addMenuButton()
        presenter?.getData()
        
        guard let image = UIImage(named: Constants.ImageName.backgroundImage) else { return }
        collectionView.backgroundView = UIImageView(image: image)
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
    
    @objc private func showMenu(){
        if self.children.count > .zero {
           dismissController()
        } else {
            showController()
        }
    }
    
    @objc private func dismissController(){
        view.gestureRecognizers?.removeLast()
        guard let controller = children.last else { return }
        removeChild(controller: controller)
        menuContainerView.removeFromSuperview()
    }
    
    private func showController() {
        // Баг: неправильно привязан к супервью, меню меняет точку ориджин соответственно прокрутке коллекции
        //TODO: написать custom presentation controller
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
            guard let self = self, self.presenter?.entity != $0 else { return }
            self.onSwitchEntity?($0)
        }
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissController))
        self.view.addGestureRecognizer(tapGestureRecognizer)
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

extension EntityViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.viewModel.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EntityCollectionViewCell.description(), for: indexPath)
        if let model = presenter?.viewModel[indexPath.item] {
            var image = UIImage()
            switch presenter?.entity {
            case .characters: image = UIImage(named: "iconCharacters")!
            case .planets: image = UIImage(named: "planet")!
            case .species: image = UIImage(named: "iconSpecies")!
            case .starships: image = UIImage(named: "iconStarships")!
            case .vehicles: image = UIImage(named: "iconVehicles")!
            default: image = UIImage()
            }
            if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                let side = (collectionView.visibleSize.width - flowLayout.minimumLineSpacing*3)/3
                let size = CGSize(width: side, height: side)
                (cell as? EntityCollectionViewCell)?.configureWith(name: model.name, image: image, imageSize: size)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let entity = presenter?.entity, let model = presenter?.viewModel[indexPath.item] else { return }
        // name пока стоит заглушкой
        //TODO: вытягивать url из модели данных (отличная от вьюмодель)
        onDetails?(entity, model.name)
    }

}
