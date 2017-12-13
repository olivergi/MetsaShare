//
//  PlanogramEditorViewController.swift
//  MetsäShare
//
//  Created by iosdev on 9.11.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class PlanogramEditorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // This is the controller for editing the planogram
    
    @IBOutlet weak var planogramView: PlanogramView!
    @IBOutlet weak var planogramPicker: UIPickerView!
    @IBOutlet weak var planogramScrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    
    var generatedPlanogram: Planogram?
    var currentProduct: Product?
    var planogramHeight: [Int] = []
    let planograms = ["Planogram 1", "Planogram 2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        planogramPicker.delegate = self
        planogramPicker.dataSource = self
        
        if generatedPlanogram != nil {
            for measurement in (generatedPlanogram?.shelfHeights)! {
                let converted = convertDimensions(dimension: measurement)
                planogramHeight.append(converted)
            }
        }
        
        planogramView.drawPlanogram(shelfHeights: [130, 110, 100], numberOfModules: 3, increment: 180)
        
        planogramView.drawProduct(productFaces: 3, shelfHeight: 130, productWidth: 60, productHeight: 40)
        planogramView.drawProduct(productFaces: 3, shelfHeight: 130, productWidth: 60, productHeight: 40, offset: 180, color: UIColor.red)
        planogramView.drawProduct(productFaces: 3, shelfHeight: 130, productWidth: 60, productHeight: 40, offset: 360, color: UIColor.blue)
        
        
        planogramView.drawProduct(productFaces: 2, shelfHeight: 110, productWidth: 50, productHeight: 40, color: UIColor.yellow, heightOffset: 130)
        planogramView.drawProduct(productFaces: 4, shelfHeight: 110, productWidth: 60, productHeight: 40, offset: 100, color: UIColor.green, heightOffset: 130)
        planogramView.drawProduct(productFaces: 3, shelfHeight: 110, productWidth: 65, productHeight: 40, offset: 340, color: UIColor.blue, heightOffset: 130)
        
        
        planogramView.drawProduct(productFaces: 3, shelfHeight: 100, productWidth: 60, productHeight: 40, color: UIColor.brown, heightOffset: 240, topShelf: true)
        planogramView.drawProduct(productFaces: 2, shelfHeight: 100, productWidth: 60, productHeight: 40, offset: 180, color: UIColor.brown, heightOffset: 240, topShelf: true)
        planogramView.drawProduct(productFaces: 1, shelfHeight: 100, productWidth: 60, productHeight: 40, offset: 300, color: UIColor.darkGray, heightOffset: 240, topShelf: true)
        planogramView.drawProduct(productFaces: 3, shelfHeight: 100, productWidth: 60, productHeight: 40, offset: 360, color: UIColor.cyan, heightOffset: 240, topShelf: true)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return planograms.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return planograms[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    func convertDimensions(dimension: Int) -> Int {
        return dimension * 5
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
