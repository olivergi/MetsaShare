//
//  ReportViewController.swift
//  MetsäShare
//
//  Created by iosdev on 13.12.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var expectedFairshare: UILabel!
    @IBOutlet weak var actualFairshare: UILabel!
    
    var expectedFS = "45%"
    var actualFS = "42%"
    var deadSpace = "12%"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        expectedFairshare.text = expectedFS
        actualFairshare.text = actualFS
        
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

}
