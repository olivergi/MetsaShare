//
//  ProcessViewController.swift
//  MetsäShare
//
//  Created by iosdev on 14.9.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class ProcessViewController: BaseViewController {
    
    // MARK: Properties
    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var productLengthTextField: UITextField!
    @IBOutlet weak var productHeightTextField: UITextField!
    @IBOutlet weak var productDepthTextField: UITextField!
    

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
    @IBAction func submitProductForm(_ sender: UIButton) {
        
    }
    

}
