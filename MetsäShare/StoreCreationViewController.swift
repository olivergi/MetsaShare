//
//  StoreCreationViewController.swift
//  MetsäShare
//
//  Created by iosdev on 25.10.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class StoreCreationViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var storeNameField: UITextField!
    @IBOutlet weak var storeChainField: UITextField!
    @IBOutlet weak var storeRetailerField: UITextField!
    @IBOutlet weak var storeAddressField: UITextField!
    @IBOutlet weak var storeContactField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
