//
//  VehicleDetailViewController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 29.10.2021.
//

import UIKit

class VehicleDetailViewController: SpinnerManager {

    var presenter: VehicleDetailPresenterProtocol?
    
    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(VehicleDetailTableViewCell.self, forCellReuseIdentifier: VehicleDetailTableViewCell.description())
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

extension VehicleDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (presenter?.specs.count ?? .zero) + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == .zero {
            let cell = tableView.dequeueReusableCell(withIdentifier: VehicleDetailTableViewCell.description(), for: indexPath)
            if let model = presenter?.model {
                (cell as? VehicleDetailTableViewCell)?.configureWith(model: model)
            }
            return cell
        } else if indexPath.section == 1, let entity = presenter?.entity, !entity.films.isEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.description(), for: indexPath)
            if let models = presenter?.specs[indexPath.section - 1] {
                (cell as? DetailTableViewCell)?.configure(models: models, size: .movie)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.description(), for: indexPath)
            if let models = presenter?.specs[indexPath.section - 1] {
                (cell as? DetailTableViewCell)?.configure(models: models, size: .entity)
            }
            return cell
        }
    }
}

extension VehicleDetailViewController: UITableViewDelegate {
    
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
