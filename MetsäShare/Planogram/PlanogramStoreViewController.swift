//
//  PlanogramStoreViewController.swift
//  MetsäShare
//
//  Created by iosdev on 13.12.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class PlanogramStoreViewController: UIViewController {

    @IBOutlet weak var planogramView: PlanogramView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        planogramView.drawPlanogram(shelfHeights: [130, 110, 100], numberOfModules: 3, increment: 180)
        
        planogramView.drawProduct(productFaces: 3, shelfHeight: 130, productWidth: 60, productHeight: 40)
        planogramView.drawProduct(productFaces: 3, shelfHeight: 130, productWidth: 60, productHeight: 40, offset: 180, color: UIColor.red)
        planogramView.drawProduct(productFaces: 3, shelfHeight: 130, productWidth: 60, productHeight: 40, offset: 360, color: UIColor.blue)
        
        
        planogramView.drawProduct(productFaces: 2, shelfHeight: 110, productWidth: 50, productHeight: 40, color: UIColor.yellow, heightOffset: 130)
        planogramView.drawProduct(productFaces: 4, shelfHeight: 110, productWidth: 60, productHeight: 40, offset: 100, color: UIColor.green, heightOffset: 130)
        planogramView.drawProduct(productFaces: 3, shelfHeight: 110, productWidth: 65, productHeight: 40, offset: 340, color: UIColor.blue, heightOffset: 130)
        
        
        planogramView.drawProduct(productFaces: 3, shelfHeight: 100, productWidth: 60, productHeight: 40, color: UIColor.brown, heightOffset: 240, topShelf: true)
        planogramView.drawProduct(productFaces: 2, shelfHeight: 100, productWidth: 60, productHeight: 40, offset: 180, color: UIColor.brown, heightOffset: 240, topShelf: true)
        planogramView.drawProduct(productFaces: 1, shelfHeight: 100, productWidth: 60, productHeight: 40, offset: 300, color: UIColor.darkGray, heightOffset: 240, topShelf: true)
        planogramView.drawProduct(productFaces: 3, shelfHeight: 100, productWidth: 60, productHeight: 40, offset: 360, color: UIColor.cyan, heightOffset: 240, topShelf: true)

        
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

}
