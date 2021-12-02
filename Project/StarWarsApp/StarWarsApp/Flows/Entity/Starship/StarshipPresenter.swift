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
    private var starships: [StarshipData] = []
    private var pageIndex: Int? = 1

    func getData() {
        viewController?.isLoading = true

        guard let pageIndex = pageIndex else {
            viewController?.isLoading = false
            return
        }
        service.fetchStarships(pageIndex: pageIndex) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.starships.append(contentsOf: data.results)
                guard let image = UIImage(named: Constants.ImageName.starships) else { return }
                self.viewModel = self.starships.map { EntityShortViewModel(name: $0.name, image: image) }
                self.viewController?.reloadView()
                self.pageIndex = self.makeIndex(from: data.next)
            case .failure(let error):
                self.viewController?.showAlert(message: error.message)
            }
            self.viewController?.isLoading = false
        }
    }

    func makeEntity(name: String) -> TransferDataProtocol? {
        return starships.filter({ $0.name == name }).first
    }

    private func makeIndex(from string: String?) -> Int? {
        guard let string = string, let lastChar: Character = string.last,
            let number = NumberFormatter().number(from: String(lastChar)) else { return nil }
        return Int(truncating: number)
    }

}
