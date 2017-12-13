//
//  ProductCreationViewController.swift
//  MetsäShare
//
//  Created by iosdev on 2.11.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class ProductCreationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var productNameField: UITextField!
    @IBOutlet weak var productLengthPicker: UIPickerView!
    @IBOutlet weak var productHeightPicker: UIPickerView!
    @IBOutlet weak var productDepthPicker: UIPickerView!
    @IBOutlet weak var productEANLabel: UILabel!
    
    //Product Info
    var productName: String = ""
    var productEAN: String = ""
    var productHeight: Int = 1
    var productWidth: Int = 1
    var productDepth: Int = 1
    var productOutOfStock: Bool = false
    
    var generatedPlanogram: Planogram?
    let faces = ["1","2","3","4","5","6","7","8","9","10"]
    var productDimension: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productLengthPicker.delegate = self
        productLengthPicker.dataSource = self
        
        productHeightPicker.delegate = self
        productHeightPicker.dataSource = self
        
        productDepthPicker.delegate = self
        productDepthPicker.dataSource = self
        
        // Populates the productDimension array with values from 1 to 100
        for i in 0...100 {
            productDimension.append(String(i))
        }
        
        productEANLabel.text = productEAN
        
        // Recognizes a single or multiple tap and calls the dismissKeyboard function
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        // Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    //MARK: - Delegates and data Sources
    //MARK: Data Sources
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return productDimension.count
    }
    
    //MARk: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return productDimension[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 1) {
            productWidth = Int(productDimension[row])!
        } else if (pickerView.tag == 2) {
            productHeight = Int(productDimension[row])!
        } else {
            productDepth = Int(productDimension[row])!
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let product = Product(name: productNameField.text!)
        productName = productNameField.text!
        
        DataController.sharedInstance.saveProduct(productWrap: constructNewProductWrapper())
        
        let destination = segue.destination as! ProductFoundViewController
        destination.generatedPlanogram = generatedPlanogram
        destination.currentProduct = product
        destination.productEAN = productEAN

    }
    
    func constructNewProductWrapper() -> ProductWrapper{
        let newProductWrapper = ProductWrapper();
        newProductWrapper.productName = productName
        if (!productEAN.isEmpty) {
            newProductWrapper.productEAN = Int(productEAN)!
        } else {
            newProductWrapper.productEAN = 0
        }
        newProductWrapper.productWidth = productWidth
        newProductWrapper.productHeight = productHeight
        newProductWrapper.productDepth = productDepth
        newProductWrapper.productOutOfStock = productOutOfStock
        
        return newProductWrapper;
    }

}
