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
    let emptySpace: Int
    
    init(name: String, faces: Int = 0, outOfStock: Bool = false, emptySpace: Int = 0) {
        self.name = name
        self.faces = faces
        self.outOfStock = outOfStock
        self.emptySpace = emptySpace
    }
}
