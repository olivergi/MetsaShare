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
    
    
    var products: [Product] = []
    var productName: String = ""
    var productFaces: Int = 0
    var productOutOfStock: Bool = false
    var productEmptySpace: Int = 0

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row

        productName = products[row].name
        productFaces = products[row].faces
        productOutOfStock = products[row].outOfStock
        productEmptySpace = products[row].emptySpace
        
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "productDetailSegue", sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "productDetailSegue" {
            let destination = segue.destination as! ProductDetailViewController
            destination.productName = productName
            destination.productFaces = productFaces
            destination.productOutOfStock = productOutOfStock
            destination.productEmptySpace = productEmptySpace
        }
    }
    
    private func loadProducts() {
        let product1 = Product(name: "Lambi WC-paperi 6 rl Love Story", faces: 3, outOfStock: false, emptySpace: 0)
        
        let product2 = Product(name: "Lambi WC-paperi 8 rl valkoinen", faces: 4, outOfStock: false, emptySpace: 2)
        
        let product3 = Product(name: "SERLA WC-paperi 16 rl Keltainen", faces: 2, outOfStock: false, emptySpace: 3)
        
        let product4 = Product(name: "SERLA WC-paperi 24 rl Keltainen", faces: 1, outOfStock: true, emptySpace: 0)
        
        let product5 = Product(name: "Lotus Embo WC-paperi 8 rl valkoinen", faces: 2, outOfStock: false, emptySpace: 0)
        
        let product6 = Product(name: "Lotus Embo WC-paperi 16 rl valkoinen", faces: 2, outOfStock: false, emptySpace: 4)
        
        products += [product1, product2, product3, product4, product5, product6]
    }

}
