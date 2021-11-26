//
//  CoreDataEntity+CoreDataProperties.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 26.11.2021.
//
//

import Foundation
import CoreData

extension CoreDataEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataEntity> {
        return NSFetchRequest<CoreDataEntity>(entityName: "CoreDataEntity")
    }

    @NSManaged public var entityType: String?
    @NSManaged public var name: String?
    @NSManaged public var image: Data?

}

extension CoreDataEntity: Identifiable {

}
