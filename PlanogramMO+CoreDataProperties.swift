//
//  PlanogramMO+CoreDataProperties.swift
//  MetsäShare
//
//  Created by iosdev on 13.12.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import Foundation
import CoreData


extension PlanogramMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlanogramMO> {
        return NSFetchRequest<PlanogramMO>(entityName: "Planogram");
    }

    @NSManaged public var bottomShelf: NSObject?
    @NSManaged public var secondShelf: NSObject?
    @NSManaged public var thirdShelf: NSObject?

}
