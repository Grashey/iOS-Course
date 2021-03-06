//
//  FavoritesPresenter.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 24.11.2021.
//

import CoreData
import UIKit

class FavoritesPresenter: FavoritesPresenterProtocol {

    weak var viewController: FavoritesViewController?

    var viewModel: [EntityShortViewModel] = []
    private let coreDataStack = Container.shared.coreDataStack

    private lazy var frc: NSFetchedResultsController<CoreDataEntity> = {
        let request = NSFetchRequest<CoreDataEntity>(entityName: "CoreDataEntity")
        request.sortDescriptors = [.init(key: "entityType", ascending: true)]
        let frc = NSFetchedResultsController(fetchRequest: request,
                                          managedObjectContext: coreDataStack.mainContext,
                                          sectionNameKeyPath: nil,
                                          cacheName: nil)
        frc.delegate = viewController
        return frc
    }()

    func getData() {
        try? frc.performFetch()
        makeModels()
    }

    func makeModels() {
        guard let objects = frc.fetchedObjects else { return }
        let models = objects.map { EntityShortViewModel(name: $0.name ?? "", image: UIImage(data: $0.image ?? Data()))}
        viewModel = models
    }

    func removeAll() {
        coreDataStack.deleteAll()
    }

}
