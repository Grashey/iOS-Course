//
//  SpeciesPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.11.2021.
//

import UIKit

class SpeciesPresenter: EntityPresenterProtocol {
    
    weak var viewController: EntityViewController?
    
    var viewModel: [EntityShortViewModel] = []
    private let service = SpeciesNetworkService()
    var species: [SpeciesData] = []
    var pageIndex: Int? = 1
    
    func getData() {
        viewController?.isLoading = true
        
        guard let pageIndex = pageIndex else {
            self.viewController?.isLoading = false
            return
        }
        service.fetchSpecies(pageIndex: pageIndex) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.species.append(contentsOf: data.results)
                    
                    guard let image = UIImage(named: Constants.ImageName.species) else { return }
                    self.viewModel = self.species.map { EntityShortViewModel(name: $0.name, image: image) }
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
            guard let species = self.species.filter({ $0.name == name }).first else { return }
            let vcAssembler = SpeciesDetailViewControllerAssembler()
            guard let detailsVC = vcAssembler.create() as? SpeciesDetailViewController else { return }
            detailsVC.presenter?.entity = species
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
