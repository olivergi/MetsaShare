//
//  PlanogramEditorViewController.swift
//  MetsäShare
//
//  Created by iosdev on 9.11.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class PlanogramEditorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

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
