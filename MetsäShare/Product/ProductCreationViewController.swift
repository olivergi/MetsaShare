//
//  ProductCreationViewController.swift
//  MetsäShare
//
//  Created by iosdev on 2.11.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class ProductCreationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var productEmptySpacePicker: UIPickerView!
    @IBOutlet weak var productFacesPicker: UIPickerView!
    
    var generatedPlanogram: Planogram?
    let faces = ["1","2","3","4","5","6","7","8","9","10"]
    let emptySpace = ["0","5","10","15","20","25","30","35","40","45","50"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productFacesPicker.delegate = self
        productFacesPicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return faces.count
    }
    
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return faces[row]
    }    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PlanogramEditorViewController
        destination.generatedPlanogram = generatedPlanogram
    }

}
