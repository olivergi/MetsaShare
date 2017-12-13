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
    @IBOutlet weak var planogramView: PlanogramView!
    
    // Array for faces picker value
    let faces = ["1","2","3","4","5","6","7","8","9","10"]
    
    var generatedPlanogram: Planogram?
    var currentProduct: Product?
    
    // Initialize variables
    var productName: String = ""
    var productFaces: Int = 1
    var productOutOfStock: Bool = false
    var productEmptySpace: Int = 0
    var productEAN: String = ""
    var productHeight: Int = 0
    var productWidth: Int = 0
    
    // Planogram Variables
    var bottomShelfHeight: Int = 70
    var secondShelfHeight: Int = 70
    var thirdShelfHeight: Int = 70
    var numberOfModules: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        productFacesPicker.delegate = self
        productFacesPicker.dataSource = self
        
        // Check if the current product value exists
        //getProductInfo()
        
        if currentProduct != nil {
            productName = (currentProduct?.name)!
        }
        
        productNameLabel.text = productName
        
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
        
        // Loop through 3 entries of shelfHeights and if any do not exist or are not set, set the shelf height as the default 70cm.
        for i in 0...2 {
            if (generatedPlanogram?.shelfHeights[i] == nil) {
                generatedPlanogram?.shelfHeights[i] = 70
            }
        }
        
        planogramView.drawPlanogram(shelfHeights: [130, 110, 100], numberOfModules: 3, increment: planogramView.moduleWidthConstant)
        
        planogramView.drawProduct(productFaces: productFaces, shelfHeight: 130, productWidth: productWidth, productHeight: productHeight)
    }

    
    // MARK: - Navigation

    // Prepare function passes on the stored values to the next view via the segue identifier
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Determine if the product is out of stock or not.
        if outOfStockSwitch.isOn {
            productOutOfStock = true
        } else {
            productOutOfStock = false
        }
        
        // Create the Product object
        let product = Product(name: productName, faces: productFaces, outOfStock: productOutOfStock, productEAN: productEAN)
        
        // Pass the product onto the next controller
        let destination = segue.destination as! ProductViewController
        destination.products.append(product)
    }
    
    func getProductInfo() {
        if currentProduct != nil {
            productName = (currentProduct?.name)!
            let entity = DataController.sharedInstance.fetchEntities("Product", withSearchTerm: productName, forVariable: "name") as! [ProductMO]
            
            productHeight = Int(entity[0].height)
            productWidth = Int(entity[0].width)
        }
    }
    
}
