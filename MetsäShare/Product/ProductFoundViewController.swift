//
//  ProductFoundViewController.swift
//  MetsäShare
//
//  Created by iosdev on 16.11.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class ProductFoundViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var productFacesPicker: UIPickerView!
    @IBOutlet weak var outOfStockSwitch: UISwitch!
    @IBOutlet weak var productNameLabel: UILabel!
    
    let faces = ["1","2","3","4","5","6","7","8","9","10"]
    
    var productName: String = ""
    var productFaces: Int = 0
    var productOutOfStock: Bool = false
    var productEmptySpace: Int = 0
    var productEAN: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        productFacesPicker.delegate = self
        productFacesPicker.dataSource = self
        
        productNameLabel.text = productName
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
