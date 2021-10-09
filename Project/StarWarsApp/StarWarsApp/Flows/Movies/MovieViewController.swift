//
//  MovieViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.10.2021.
//

import UIKit

class MovieViewController: UITableViewController {
    
    var presenter: MoviePresenterProtocol?
    
    override func viewDidLoad() {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        presenter?.getData()
    }
    
    func reload() {
        tableView.reloadData()
    }
    
    //MARK: TableView DataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.viewModel.count ?? .zero
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let model = presenter?.viewModel[indexPath.section] {
            cell.textLabel?.text = model.director
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let model = presenter?.viewModel[section] {
            return model.title
        }
        return String()
    }
}
