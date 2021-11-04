//
//  MovieViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.10.2021.
//

import UIKit

class MovieViewController: UITableViewController {
    
    var presenter: MoviePresenterProtocol?
    
    var onDetails: ((MovieData) -> Void)?
    private let spinner = SpinnerViewController()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        spinner.view.frame = view.frame
    }
    
    func reloadTable() {
        tableView.reloadData()
    }
    
    func reloadCell(index: Int) {
        let indexPath = IndexPath(row: index, section: .zero)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func showSpinner(isShown: Bool) {
        if isShown {
            addChild(spinner)
            view.addSubview(spinner.view)
            spinner.didMove(toParent: self)
        } else {
            spinner.willMove(toParent: nil)
            spinner.view.removeFromSuperview()
            spinner.removeFromParent()
        }
    }
    
    //MARK: TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.viewModels.count ?? .zero
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.description(), for: indexPath)
        if let model = presenter?.viewModels[indexPath.row] {
            (cell as? MovieTableViewCell)?.configureWith(model: model)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let model = presenter?.movies[indexPath.row] {
            onDetails?(model)
        }
    }
    
}
