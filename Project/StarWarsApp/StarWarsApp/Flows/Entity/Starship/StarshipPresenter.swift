//
//  StarshipPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.11.2021.
//

import UIKit

class StarshipPresenter: EntityPresenterProtocol {
    
    weak var viewController: EntityViewController?
    
    var viewModel: [EntityShortViewModel] = []
    private let service = StarshipNetworkService()
    var starships: [StarshipData] = []
    var pageIndex: Int? = 1
    
    func getData() {
        viewController?.isLoading = true
        
        guard let pageIndex = pageIndex else {
            self.viewController?.isLoading = false
            return
        }
        service.fetchStarships(pageIndex: pageIndex) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.starships.append(contentsOf: data.results)
                    
                    guard let image = UIImage(named: Constants.ImageName.starships) else { return }
                    self.viewModel = self.starships.map { EntityShortViewModel(name: $0.name, image: image) }
                    self.viewController?.collectionView.reloadData()
                    self.pageIndex = self.makeIndex(from: data.next)
                    
                case .failure(let error):
                    self.showAlert(message: error.message)
                }
                self.viewController?.isLoading = false
            }
        }
    }
    
    func start() {
        getData()
        
        viewController?.onDetails = { name in
            guard let starship = self.starships.filter({ $0.name == name }).first else { return }
            let vcAssembler = StarshipDetailViewControllerAssembler()
            guard let detailsVC = vcAssembler.create() as? StarshipDetailViewController else { return }
            detailsVC.presenter?.entity = starship
            self.viewController?.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
    
    private func showAlert(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Опаньки, что-то пошло не так!",
                                          message: message,
                                          preferredStyle: .alert)
            self.viewController?.present(alert, animated: true)
        }
    }
    
    private func makeIndex(from string: String?)  -> Int? {
        guard let string = string, let lastChar: Character = string.last,
            let number = NumberFormatter().number(from: String(lastChar)) else { return nil }
        return Int(truncating: number)
    }
    
}
