//
//  Location.swift
//  MetsäShare
//
//  Created by iosdev on 5.10.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class Location {
    
    let name: String
    let chain: String
    let retailer: String
    let address: String
    let contact: String?
    
    // MARK: Initialization
    init?(name: String, chain: String? = nil, retailer: String? = nil, address: String, contact: String? = nil) {
        
        if name.isEmpty {
            return nil
        }
        
        self.name = name
        self.chain = chain!
        self.retailer = retailer!
        self.address = address
        self.contact = contact
    }
    
}
