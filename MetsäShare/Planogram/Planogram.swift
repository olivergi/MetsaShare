//
//  Planogram.swift
//  MetsäShare
//
//  Created by iosdev on 8.11.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class Planogram: NSObject {

    var modules: Int
    var shelfHeights: [Int] = []
    let moduleWidth: Int = 90
    
    // MARK: Initialization
    init?(modules: Int, shelfHeights: [Int]) {
        self.modules = modules
        self.shelfHeights = shelfHeights
        
    }
    
    func convertMeasuremeants(shelfHeights: [Int], modules: Int) {
        for shelf in shelfHeights {
            // Convert shelf height in cm to pixels to be able to draw Planogram on screen
        }
    }
    

}
