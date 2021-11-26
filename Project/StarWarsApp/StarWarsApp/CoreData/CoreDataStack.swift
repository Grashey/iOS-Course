//
//  CoreDataStack.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 26.11.2021.
//

import Foundation
import CoreData

class CoreDataStack {

    private let container: NSPersistentContainer

    let mainContext: NSManagedObjectContext
    lazy var backgroundContext: NSManagedObjectContext = container.newBackgroundContext()
    var coordinator: NSPersistentStoreCoordinator { container.persistentStoreCoordinator }
    let fetchRequest = NSFetchRequest<CoreDataEntity>(entityName: "CoreDataEntity")

    init(modelName: String) {
        let container = NSPersistentContainer(name: modelName)
        self.container = container

        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
        let url = URL(fileURLWithPath: documentsPath).appendingPathComponent("CoreDataEntity.sqlite")

        do {
            try container.persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                              configurationName: nil,
                                              at: url,
                                              options: [NSMigratePersistentStoresAutomaticallyOption: true,
                                                        NSInferMappingModelAutomaticallyOption: true])
        } catch {
            print(error)
            fatalError()
        }

        self.mainContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        self.mainContext.persistentStoreCoordinator = coordinator

        self.backgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        self.backgroundContext.persistentStoreCoordinator = coordinator

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(contextDidChange(notification:)),
                                               name: Notification.Name.NSManagedObjectContextDidSave,
                                               object: self.backgroundContext)
    }

    func loadAll() {
        container.loadPersistentStores { _, error in
            if let error = error {
                assertionFailure(error.localizedDescription)
            }
        }
    }

    func check(name: String) -> Bool {
        self.fetchRequest.predicate = .init(format: "name == '\(name)'")
        var favorites = [CoreDataEntity]()
        backgroundContext.performAndWait {
            let result = try? fetchRequest.execute()
            if let result = result {
                favorites = result
            }
        }
        if !favorites.isEmpty {
            return true
        } else {
            return false
        }
    }

    func deleteAll() {
        backgroundContext.performAndWait {
            let favorites = try? fetchRequest.execute()
            favorites?.forEach {
                backgroundContext.delete($0)
            }
            try? backgroundContext.save()
        }
    }

    func delete(name: String) {
        fetchRequest.predicate = .init(format: "name == '\(name)'")
        backgroundContext.performAndWait {
            if let objectToDelete = try? fetchRequest.execute().first {
                backgroundContext.delete(objectToDelete)
            }
            try? backgroundContext.save()
        }
    }

    func addEntity(name: String, type: String, imageData: Data) {
        mainContext.performAndWait {
            let entity = CoreDataEntity(context: mainContext)
            entity.name = name
            entity.entityType = type
            entity.image = imageData
            try? mainContext.save()
        }
    }

}

extension CoreDataStack {
    @objc func contextDidChange(notification: Notification) {
        coordinator.performAndWait {
            mainContext.performAndWait {
                mainContext.mergeChanges(fromContextDidSave: notification)
            }
        }
    }
}
