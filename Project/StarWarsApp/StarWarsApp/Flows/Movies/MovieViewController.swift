//
//  MovieViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.10.2021.
//

import UIKit

class MovieViewController: UITableViewController {
    
    var presenter: MoviePresenterProtocol?
    
    var onDetails: ((MovieViewModel) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.description())
        presenter?.getData()
        self.navigationItem.title = Constants.TabBarTitle.movies

        guard let image = UIImage(named: Constants.ImageName.backgroundImage) else { return }
        tableView.backgroundView = UIImageView(image: image)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    func reload() {
        tableView.reloadData()
    }
    
    //MARK: TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.viewModel?.count ?? .zero
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.description(), for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        if let model = presenter?.viewModel?[indexPath.row] {
            cell.configureWith(model: model)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let model = presenter?.viewModel?[indexPath.row] {
            onDetails?(model)
        }
    }
    
}
