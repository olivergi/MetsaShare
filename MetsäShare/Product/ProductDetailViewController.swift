//
//  ProductDetailViewController.swift
//  MetsäShare
//
//  Created by iosdev on 5.10.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: Properties
    @IBOutlet weak var productOutOfStockSwitch: UISwitch!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productEmptySpacePicker: UIPickerView!
    @IBOutlet weak var productFacesPicker: UIPickerView!
    let faces = ["1","2","3","4","5","6","7","8","9","10"]
    let emptySpace = ["0","5","10","15","20","25","30","35","40","45","50"]
    
    var productName: String = ""
    var productFaces: Int = 0
    var productOutOfStock: Bool = false
    var productEmptySpace: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productFacesPicker.delegate = self
        productFacesPicker.dataSource = self
        
        productEmptySpacePicker.delegate = self
        productEmptySpacePicker.dataSource = self
        
        productNameLabel.text = productName
        productOutOfStockSwitch.setOn(productOutOfStock, animated: true)
        productFacesPicker.selectRow(productFaces - 1, inComponent: 0, animated: true)
        productEmptySpacePicker.selectRow(productEmptySpace, inComponent: 0, animated: true)
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
        if (pickerView.tag == 1) {
            return faces.count
        } else {
            return emptySpace.count
        }
    }
    
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1){
            return faces[row]
        } else {
            return emptySpace[row]
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
