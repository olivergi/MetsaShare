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
    
    let shelfHeight = ["0","5","10", "15","20","25","30","35","40","45","50","55","60","65","70","75","80","85","90","95","100","105","110","115","120","125","130"]
    
    var bottomShelfHeight: Int = 0
    var secondShelfHeight: Int = 0
    var thirdShelfHeight: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomShelfPicker.delegate = self
        bottomShelfPicker.dataSource = self
        
        secondShelfPicker.delegate = self
        secondShelfPicker.dataSource = self
        
        thirdShelfPicker.delegate = self
        thirdShelfPicker.dataSource = self
        
        moduleTextField.keyboardType = UIKeyboardType.numberPad
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Delegates and data Sources
    //MARK: Data Sources
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return shelfHeight.count;
    }
    
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return shelfHeight[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == bottomShelfPicker) {
            bottomShelfHeight = Int(shelfHeight[row])!
            print(bottomShelfHeight)
        } else if (pickerView == secondShelfPicker) {
            secondShelfHeight = Int(shelfHeight[row])!
            print(secondShelfHeight)
        } else if (pickerView == thirdShelfPicker) {
            thirdShelfHeight = Int(shelfHeight[row])!
            print(thirdShelfHeight)
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
    
    // MARK: Actions
    @IBAction func createPlanogram(_ sender: Any) {
        if(moduleTextField.text == "") {
            let alert = UIAlertController(title: "Error",
                                          message: "Please fill in number of modules",
                                          preferredStyle: UIAlertControllerStyle.alert)
            
            let cancelAction = UIAlertAction(title: "OK",
                                             style: .cancel, handler: nil)
            
            alert.addAction(cancelAction)
            present(alert, animated: true)
        } else {
            let planogram = Planogram(modules: Int(moduleTextField.text!)!, shelfHeights: [bottomShelfHeight, secondShelfHeight, thirdShelfHeight])
            print(planogram?.shelfHeights)
        }
    }
    
}
