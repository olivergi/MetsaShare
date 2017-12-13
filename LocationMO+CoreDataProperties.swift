//
//  LocationMO+CoreDataProperties.swift
//  MetsäShare
//
//  Created by iosdev on 13.12.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import Foundation
import CoreData


extension LocationMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LocationMO> {
        return NSFetchRequest<LocationMO>(entityName: "Location");
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var planogram: NSObject?
    @NSManaged public var chain: String?
    @NSManaged public var contact: String?

}
