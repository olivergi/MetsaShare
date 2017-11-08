//
//  StoreCreationViewController.swift
//  MetsäShare
//
//  Created by iosdev on 25.10.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class StoreCreationViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: Properties
    @IBOutlet weak var storeNameField: UITextField!
    @IBOutlet weak var storeAddressField: UITextField!
    @IBOutlet weak var storeContactField: UITextField!
    
    @IBOutlet weak var storeRetailerPicker: UIPickerView!
    @IBOutlet weak var storeChainPicker: UIPickerView!
    
    var selectedRetailerArray: [String] = []
    let retailers = ["Kesko", "S-Group"]
    let keskoChains = ["K-Market", "K-Supermarket", "K-CityMarket"]
    let sgroupChains = ["S-Market", "Prisma", "Alepa", "Sale"]

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedRetailerArray = keskoChains
        
        storeRetailerPicker.delegate = self
        storeRetailerPicker.dataSource = self
        
        storeChainPicker.delegate = self
        storeChainPicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1) {
            return retailers.count
        } else {
            return selectedRetailerArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1) {
            return retailers[row]
        } else {
            return selectedRetailerArray[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 1) {
            switch row {
            case 0:
                selectedRetailerArray = keskoChains
            case 1:
                selectedRetailerArray = sgroupChains
            default:
                selectedRetailerArray = []
            }
            storeChainPicker.reloadAllComponents()
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
    @IBAction func createStore(_ sender: Any) {
       /* let newLocation = Location(name: storeNameField.text!, chain: storeChainField.text, retailer: storeRetailerField.text, address: storeAddressField.text!, contact: storeContactField.text)
        */
    }
    
}
