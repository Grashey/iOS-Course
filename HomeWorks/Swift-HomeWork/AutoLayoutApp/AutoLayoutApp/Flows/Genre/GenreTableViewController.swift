//
//  GenreTableViewController.swift
//  AutoLayoutApp
//
//  Created by Aleksandr Fetisov on 12.10.2021.
//

import UIKit

class GenreTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(GenreTableViewCell.self, forCellReuseIdentifier: GenreTableViewCell.description())
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.showsVerticalScrollIndicator = false
    }

}
