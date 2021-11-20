//
//  MovieDetailViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 18.10.2021.
//

import UIKit

class MovieDetailViewController: SpinnerManager {

    var presenter: MovieDetailPresenterProtocol?

    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(MovieDetailTableViewCell.self, forCellReuseIdentifier: MovieDetailTableViewCell.description())
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

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.getData()
    }

}

extension MovieDetailViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return (presenter?.specs.count ?? .zero) + 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case .zero:
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieDetailTableViewCell.description(), for: indexPath)
            if let model = presenter?.model {
                (cell as? MovieDetailTableViewCell)?.configureWith(model: model)
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.description(), for: indexPath)
            if let models = presenter?.specs[indexPath.section - 1] {
                (cell as? DetailTableViewCell)?.configure(models: models, size: .entity)
            }
            return cell
        }
    }
}

extension MovieDetailViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case .zero:
            return nil
        default:
            return presenter?.makeLabelFor(section: section - 1)
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
