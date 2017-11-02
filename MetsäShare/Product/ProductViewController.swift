//
//  ProductViewController.swift
//  MetsäShare
//
//  Created by iosdev on 5.10.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    @IBOutlet weak var productTableView: UITableView!
    
    
    var products = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        productTableView.dataSource = self
        productTableView.delegate = self
        
        loadProducts()
        productTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "productCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ProductTableViewCell else {
            fatalError("The dequeued cell is not an instance of ProductTableViewCell.")
        }
        
        cell.productNameLabel.text = products[indexPath.row].name
        cell.faceCountLabel.text = "Faces: \(products[indexPath.row].faces)"
        
        return cell
    }
    
    private func loadProducts() {
        let product1 = Product(name: "Lambi WC-paperi 6 rl Love Story")
        
        let product2 = Product(name: "Lambi WC-paperi 8 rl valkoinen")
        
        let product3 = Product(name: "SERLA WC-paperi 16 rl Keltainen")
        
        let product4 = Product(name: "SERLA WC-paperi 24 rl Keltainen")
        
        let product5 = Product(name: "Lotus Embo WC-paperi 8 rl valkoinen")
        
        let product6 = Product(name: "Lotus Embo WC-paperi 16 rl valkoinen")
        
        products += [product1, product2, product3, product4, product5, product6]
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
    @IBAction func locationListButton(_ sender: Any) {
    }
    

}
