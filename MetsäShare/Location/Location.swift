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
    
    // MARK: Initialization
    init?(name: String, address: String) {
        
        if name.isEmpty {
            return nil
        }
        
        self.name = name
        self.address = address
    }
    
}
