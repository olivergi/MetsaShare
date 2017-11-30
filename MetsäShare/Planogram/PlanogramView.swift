//
//  PlanogramView.swift
//  MetsäShare
//
//  Created by iosdev on 29.11.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class PlanogramView: UIView {
    
    let increment: Double = 0.25
    var moduleWidthConstant: Int = 90
    var heightOffset: Int = 0
    
    override func draw(_ rect: CGRect) {
       
        /* let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(4.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        let rectangle = CGRect(x: 60,y: 170,width: 200,height: 80)
        context?.addRect(rectangle)
        context?.strokePath() */
        
        drawPlanogram(shelfHeights: [20, 30, 40], numberOfModules: 3, increment: moduleWidthConstant)
    }
    
    func drawProduct() {
        
    }
    
    func drawPlanogram(shelfHeights: [Int], numberOfModules: Int, increment: Int) {
        for i in 0...(shelfHeights.count - 1) {
            heightOffset = heightOffset + shelfHeights[i]
            let currentShelfHeight = shelfHeights[i]
            let shelf = CGRect(x: 30, y: (30 + heightOffset) , width: increment, height: currentShelfHeight)
            
            for i in 0...numberOfModules {
                let shelf = CGRect(x: (30 + (moduleWidthConstant * i)), y: 30, width: moduleWidthConstant, height: currentShelfHeight)
            }
        }
    }

}
