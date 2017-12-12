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
    @IBOutlet weak var productFacesPicker: UIPickerView!
    @IBOutlet weak var planogramView: PlanogramView!
    
    
    let faces = ["1","2","3","4","5","6","7","8","9","10"]
    
    var productName: String = ""
    var productFaces: Int = 1
    var productOutOfStock: Bool = false
    var productEmptySpace: Int = 0
    var productEAN: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productFacesPicker.delegate = self
        productFacesPicker.dataSource = self
        
        productNameLabel.text = productName
        productOutOfStockSwitch.setOn(productOutOfStock, animated: true)
        productFacesPicker.selectRow(productFaces - 1, inComponent: 0, animated: true)
        
        generatePlanogramView()
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        productFaces = Int(faces[row])!
        generatePlanogramView()
    }
    
    // Planogram View Functions
    func generatePlanogramView() {
        // Clear the Planogram View of all subviews
        planogramView.clearView(view: planogramView)
        
        planogramView.drawPlanogram(shelfHeights: [130, 110, 100], numberOfModules: 3, increment: planogramView.moduleWidthConstant)
        
        planogramView.drawProduct(productFaces: productFaces, shelfHeight: 130)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: Actions
    // Function for the Save button in the Product Details view
    @IBAction func saveProductDetails(_ sender: Any) {
        let alert = UIAlertController(title: "Save", message: "Product detail saved", preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    

}
