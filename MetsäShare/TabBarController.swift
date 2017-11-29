//
//  TabBarController.swift
//  MetsäShare
//
//  Created by iosdev on 16.11.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    var currentProduct: Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let productTab = self.tabBarController?.viewControllers?[0] as! ProductViewController
        productTab.products.append(currentProduct!)
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
