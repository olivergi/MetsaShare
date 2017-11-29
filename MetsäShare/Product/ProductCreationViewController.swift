//
//  ProductCreationViewController.swift
//  MetsäShare
//
//  Created by iosdev on 2.11.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class ProductCreationViewController: UIViewController {

    @IBOutlet weak var productEmptySpacePicker: UIPickerView!
    @IBOutlet weak var productNameField: UITextField!
    
    var generatedPlanogram: Planogram?
    let faces = ["1","2","3","4","5","6","7","8","9","10"]
    let emptySpace = ["0","5","10","15","20","25","30","35","40","45","50"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Recognizes a single or multiple tap and calls the dismissKeyboard function
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let product = Product(name: productNameField.text!)
        
        let destination = segue.destination as! ProductFoundViewController
        destination.generatedPlanogram = generatedPlanogram
        destination.currentProduct = product

    }

}
