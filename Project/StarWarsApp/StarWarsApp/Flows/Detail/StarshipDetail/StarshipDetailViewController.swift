//
//  StarshipDetailViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 28.10.2021.
//

import UIKit

class StarshipDetailViewController: SpinnerManager {

    var presenter: StarshipDetailPresenterProtocol?

    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(StarshipDetailTableViewCell.self, forCellReuseIdentifier: StarshipDetailTableViewCell.description())
        $0.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.description())
        $0.rowHeight = UITableView.automaticDimension
        $0.separatorStyle = .none
        $0.allowsSelection = false
        if let image = UIImage(named: Constants.ImageName.backgroundImage) {
            $0.backgroundView = UIImageView(image: image)
        }
        return $0
    }(UITableView())

    override func loadView() {
        view = tableView
    }

    lazy var favoriteButton: UIButton = {
        $0.frame = CGRect(x: .zero, y: .zero, width: 30, height: 30)
        $0.addTarget(self, action: #selector(operateFavorites), for: .touchUpInside)
        return $0
    }(UIButton())

    lazy var favoriteButtonView: UIView = {
        $0.frame = CGRect(x: .zero, y: .zero, width: 30, height: 30)
        $0.addSubview(favoriteButton)
        return $0
    }(UIView())

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.getData()
        makeFavoritesButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.checkIsFavorite()
    }

    private func makeFavoritesButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: favoriteButtonView)
        switchRightBarButtonItemImage()
    }

    @objc func operateFavorites() {
        presenter?.operateFavorites()
    }

    func switchRightBarButtonItemImage() {
        if let isSaved = presenter?.isSaved, isSaved {
            favoriteButton.setImage(UIImage(named: Constants.FavoriteButtonImage.isFavorite), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(named: Constants.FavoriteButtonImage.isNotFavorite), for: .normal)
        }
    }

    func reloadTable() {
        self.tableView.reloadData()
    }

    func reloadCell(index: Int) {
        let indexPath = IndexPath(row: .zero, section: index)
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: Constants.AlertTitle.message,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.AlertTitle.okey, style: .default, handler: nil))
        present(alert, animated: true)
    }

}

extension StarshipDetailViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return (presenter?.specs.count ?? .zero) + 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == .zero {
            let cell = tableView.dequeueReusableCell(withIdentifier: StarshipDetailTableViewCell.description(), for: indexPath)
            if let model = presenter?.model {
                (cell as? StarshipDetailTableViewCell)?.configureWith(model: model)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.description(), for: indexPath)
            if let models = presenter?.specs[indexPath.section - 1] {
                if indexPath.section == 1, let entity = presenter?.entity, !entity.films.isEmpty {
                    (cell as? DetailTableViewCell)?.configure(models: models, size: .poster)
                } else {
                    (cell as? DetailTableViewCell)?.configure(models: models, size: .avatar)
                }
            }
            return cell
        }
    }
}

extension StarshipDetailViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case .zero:
            let view = UIView()
            view.backgroundColor = .clear
            return view
        default:
            let label = BaseLabel()
            label.font = UIFont(name: Constants.Fonts.main, size: 18)
            label.textColor = .yellow
            label.text = presenter?.getLabelTitleFor(section: section - 1)
            return label
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let sectionHeaderHeight: CGFloat = 40
        if scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= .zero {
            scrollView.contentInset = UIEdgeInsets(top: -scrollView.contentOffset.y, left: .zero, bottom: .zero, right: .zero)
        } else if scrollView.contentOffset.y >= sectionHeaderHeight {
            scrollView.contentInset = UIEdgeInsets(top: -sectionHeaderHeight, left: .zero, bottom: .zero, right: .zero)
        }
    }
}
