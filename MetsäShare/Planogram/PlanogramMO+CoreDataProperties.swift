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

    @NSManaged public var bottomShelf: Int16
    @NSManaged public var secondShelf: Int16
    @NSManaged public var thirdShelf: Int16

}
