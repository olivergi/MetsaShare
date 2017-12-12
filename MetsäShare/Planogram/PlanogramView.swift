//
//  PlanogramView.swift
//  MetsäShare
//
//  Created by iosdev on 29.11.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit
import Foundation

class PlanogramView: UIView {
    
    let mutliplier: Double = 2.0
    var moduleWidthConstant: Int = 180
    
    override func draw(_ rect: CGRect) {
      
    }
    
    // Function that draws the Products onto the planogram View
    func drawProduct(productFaces: Int, shelfHeight: Int) {
        // Initialize productOffset, incrementing the space between each drawn product position
        var productOffset = 0
        let productWidth = 60
        let productHeight = 40
        
        // TODO: Y should be ShelfHeights - ProductHeight as 0,0 starts in top left.
        
        // Checks the space available for a maximum amount of products in the height of 1 shelf
        let productsInShelf = Int((Double(shelfHeight / productHeight)).rounded(.down))
        var productHeightOffset = 0
        
        // Loop for the number of products in the Shelf (height)
        for _ in 1...productsInShelf {
            
            // Loop for the number of faces (width)
            for _ in 1...productFaces {
                // Draw the Product image
                let product = CGRect(x: (30 + productOffset), y: (330 - productHeightOffset), width: productWidth, height: productHeight)
                let productView = UIView (frame: product)
                productView.layer.borderWidth = 2
                productView.layer.borderColor = UIColor.black.cgColor
                productView.backgroundColor = UIColor.green
                self.addSubview(productView)
                
                // Increment the productOffset
                productOffset = productOffset + productWidth
            }
            
            // Reset the product after productFaces loop completes
            productOffset = 0
            productHeightOffset = productHeightOffset + productHeight
        }
    }
    
    func drawPlanogram(shelfHeights: [Int], numberOfModules: Int, increment: Int) {
        var heightOffset: Int = 30
        // Reverse the Array as the order in which the items are drawn is from top to bottom, and the bottom shelf (first entry in the array) needs to be drawn last.
        var shelfHeightsReversed = Array(shelfHeights.reversed())
        
        for i in 0...(shelfHeightsReversed.count - 1) {
            let shelf = CGRect(x: 30, y: heightOffset , width: increment, height:shelfHeightsReversed[i])
            let shelfView = UIView (frame: shelf)
            shelfView.layer.borderWidth = 4
            shelfView.layer.borderColor = UIColor.black.cgColor
            self.addSubview(shelfView)
            
            for j in 0...(numberOfModules - 1) {
                let shelf = CGRect(x: 30 + (moduleWidthConstant * j), y: heightOffset, width: increment, height: shelfHeightsReversed[i])
                let shelfView = UIView (frame: shelf)
                shelfView.layer.borderWidth = 4
                shelfView.layer.borderColor = UIColor.black.cgColor
                self.addSubview(shelfView)
            }
        
            heightOffset = heightOffset + shelfHeightsReversed[i]
        }
    }
    
    // Function that clears the view of all subviews
    func clearView(view: UIView) {
        while let subview = view.subviews.last {
            subview.removeFromSuperview()
        }
    }

}
