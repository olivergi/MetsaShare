//
//  ProductMO+CoreDataProperties.swift
//  MetsäShare
//
//  Created by iosdev on 13.12.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import Foundation
import CoreData


extension ProductMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductMO> {
        return NSFetchRequest<ProductMO>(entityName: "Product");
    }

    @NSManaged public var name: String?
    @NSManaged public var height: Int16
    @NSManaged public var width: Int16
    @NSManaged public var depth: Int16
    @NSManaged public var eanCode: Int64
    @NSManaged public var outOfStock: Bool
    @NSManaged public var location: String?

}
