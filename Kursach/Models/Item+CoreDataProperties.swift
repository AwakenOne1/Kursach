//
//  Item+CoreDataProperties.swift
//  Kursach
//
//  Created by Alexey Dubovik on 4.05.24.
//
//

import Foundation
import CoreData

extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var title: String?
    @NSManaged public var imageName: String

}

extension Item: Identifiable {
}
