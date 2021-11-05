//
//  EntityPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 20.10.2021.
//

import UIKit

class EntityPresenter: EntityPresenterProtocol {
    
    weak var viewController: EntityViewController?
    
    var entity = EntityRoute.characters
    var viewModel: [EntityShortViewModel] = []
    private let service = EntityNetworkService()
    var characters: [CharacterData] = []
    var pageIndex: Int? = 1
    
    func getData() {
        viewController?.isLoading = true
        
        guard let pageIndex = pageIndex else {
            self.viewController?.isLoading = false
            return
        }
        service.fetchCharacters(pageIndex: pageIndex) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.characters.append(contentsOf: data.results)
                    
                    self.viewModel = self.characters.map { EntityShortViewModel(name: $0.name) }
                    self.viewController?.collectionView.reloadData()
//                    self.viewController?.collectionView.scrollToItem(at: IndexPath(item: .zero, section: .zero), at: .top, animated: false)
                    self.pageIndex = self.makeIndex(from: data.next)
                    
                case .failure(let error):
                    self.showAlert(message: error.message)
                }
                self.viewController?.isLoading = false
            }
        }
    }
    
    func getTitleName() -> String {
        switch entity {
        case .characters: return Constants.Entity.characters
        case .planets: return Constants.Entity.planets
        case .species: return Constants.Entity.species
        case .starships: return Constants.Entity.starships
        case .vehicles: return Constants.Entity.vehicles
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
