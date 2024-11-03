//
//  Product+CoreDataProperties.swift
//  MyPOSDataModel
//
//  Created by 강성찬 on 2024-10-31.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }
    
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var quantity: Int16
    @NSManaged public var smallPicture: String?
    @NSManaged public var largePicture: String?
    @NSManaged public var type: String?
    @NSManaged public var size: String?
    @NSManaged public var color: String?

}

extension Product : Identifiable {

}
