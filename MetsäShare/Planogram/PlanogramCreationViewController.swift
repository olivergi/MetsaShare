//
//  PlanogramCreationViewController.swift
//  MetsäShare
//
//  Created by iosdev on 8.11.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class PlanogramCreationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: Properties
    @IBOutlet weak var bottomShelfPicker: UIPickerView!
    @IBOutlet weak var secondShelfPicker: UIPickerView!
    @IBOutlet weak var thirdShelfPicker: UIPickerView!
    @IBOutlet weak var moduleTextField: UITextField!
    
    var shelfHeight: [String] = []
    
    var bottomShelfHeight: Int = 0
    var secondShelfHeight: Int = 0
    var thirdShelfHeight: Int = 0
    var defaultShelfHeight: Int = 70
    var generatedPlanogram: Planogram? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomShelfPicker.delegate = self
        bottomShelfPicker.dataSource = self
        
        secondShelfPicker.delegate = self
        secondShelfPicker.dataSource = self
        
        thirdShelfPicker.delegate = self
        thirdShelfPicker.dataSource = self
        
        // Populates the shelfHeight array with values from 1 to 100
        for i in 0...100 {
            shelfHeight.append(String(i))
        }
        
        // Set the type of the keybaord for the moduleTextField to be numberPad
        moduleTextField.keyboardType = UIKeyboardType.numberPad
        
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
    
    //MARK: - Delegates and data Sources
    //MARK: Data Sources
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return shelfHeight.count
    }
    
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return shelfHeight[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // A function that checks the currently selected PickerView that is having it's value changed and sets the corresponding value as the selected value of the pickerView.
        if (pickerView == bottomShelfPicker) {
            bottomShelfHeight = Int(shelfHeight[row])!
        } else if (pickerView == secondShelfPicker) {
            secondShelfHeight = Int(shelfHeight[row])!
        } else if (pickerView == thirdShelfPicker) {
            thirdShelfHeight = Int(shelfHeight[row])!
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! CameraViewController
        destination.generatedPlanogram = generatedPlanogram
        
    }
    
    // MARK: Actions
    @IBAction func createPlanogram(_ sender: Any) {
        // Alert for checking whether a number of modules has been set, if not it will present the error to the user, prompting them to enter a value for the number of modules.
        if(moduleTextField.text == "") {
            let alert = UIAlertController(title: "Error",
                                          message: "Please fill in number of modules",
                                          preferredStyle: UIAlertControllerStyle.alert)
            
            let cancelAction = UIAlertAction(title: "OK",
                                             style: .cancel, handler: nil)
            
            alert.addAction(cancelAction)
            present(alert, animated: true)
        } else {
            generatedPlanogram = Planogram(modules: Int(moduleTextField.text!)!, shelfHeights: [bottomShelfHeight, secondShelfHeight, thirdShelfHeight])
        }
    }
    
}
