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
    let address: String
    let products: [Product]
    
    // MARK: Initialization
    init?(name: String, address: String, products: [Product] = []) {
        
        if name.isEmpty {
            return nil
        }
        
        self.products = products
        self.name = name
        self.address = address
    }
    
}
