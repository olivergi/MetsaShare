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
    
    let shelfHeight = ["20","25","30","35","40","45","50","55","60","65","70","75","80","85","90","95","100","105","110","115","120","125","130"]

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
