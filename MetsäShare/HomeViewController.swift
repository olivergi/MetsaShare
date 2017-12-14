//
//  HomeViewController.swift
//  MetsäShare
//
//  Created by iosdev on 28.9.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

// Class extends BaseViewController Class to access the addSlideMenuButton() function, which will add the side menu to the Home screen. 
class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSlideMenuButton()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: Actions
    @IBAction func newLocationButton(_ sender: UIButton) {
    }
}
