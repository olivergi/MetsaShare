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
    @IBOutlet weak var productFacesPicker: UIPickerView!
    let faces = ["1","2","3","4","5","6","7","8","9","10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productFacesPicker.dataSource = self
        productFacesPicker.delegate = self
        // Do any additional setup after loading the view.
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
