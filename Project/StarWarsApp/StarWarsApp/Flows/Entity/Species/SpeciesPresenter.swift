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
    private var species: [SpeciesData] = []
    private var pageIndex: Int? = 1

    func getData() {
        viewController?.isLoading = true

        guard let pageIndex = pageIndex else {
            viewController?.isLoading = false
            return
        }
        service.fetchSpecies(pageIndex: pageIndex) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.species.append(contentsOf: data.results)
                guard let image = UIImage(named: Constants.ImageName.species) else { return }
                self.viewModel = self.species.map { EntityShortViewModel(name: $0.name, image: image) }
                self.viewController?.reloadView()
                self.pageIndex = self.makeIndex(from: data.next)
            case .failure(let error):
                self.viewController?.showAlert(message: error.message)
            }
            self.viewController?.isLoading = false
        }
    }

    func makeEntity(name: String) -> TransferDataProtocol? {
        return species.filter({ $0.name == name }).first
    }

    private func makeIndex(from string: String?) -> Int? {
        guard let string = string, let lastChar: Character = string.last,
            let number = NumberFormatter().number(from: String(lastChar)) else { return nil }
        return Int(truncating: number)
    }

}
