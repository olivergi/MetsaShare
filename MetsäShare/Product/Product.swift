//
//  Product.swift
//  MetsäShare
//
//  Created by iosdev on 5.10.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class Product {
    
    let name: String
    let faces: Int
    let outOfStock: Bool
    
    init(name: String) {
        self.name = name
        self.faces = 0
        self.outOfStock = false
    }
}
