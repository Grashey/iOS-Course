//
//  MovieViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.10.2021.
//

import UIKit

class MovieViewController: SpinnerManager {

    var presenter: MoviePresenterProtocol?

    var onDetails: ((MovieData) -> Void)?

    lazy var tableView: UITableView = {
        if let image = UIImage(named: Constants.ImageName.backgroundImage) {
            $0.backgroundView = UIImageView(image: image)
        }
        $0.separatorStyle = .none
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = UITableView.automaticDimension
        $0.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.description())
        return $0
    }(UITableView())

    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        presenter?.getData()
        self.navigationItem.title = Constants.TabBarTitle.movies
    }

    func reloadTable() {
        tableView.reloadData()
    }

    func reloadCell(index: Int) {
        let indexPath = IndexPath(row: index, section: .zero)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

}
    // MARK: TableView DataSource
extension MovieViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.viewModels.count ?? .zero
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.description(), for: indexPath)
        if let model = presenter?.viewModels[indexPath.row] {
            (cell as? MovieTableViewCell)?.configureWith(model: model)
        }
        cell.selectionStyle = .none
        return cell
    }
}

extension MovieViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let movie = presenter?.movies[indexPath.row] {
            onDetails?(movie)
        }
    }
}
