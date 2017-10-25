//
//  BrowseLocationViewController.swift
//  MetsäShare
//
//  Created by iosdev on 4.10.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class LocationViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    @IBOutlet weak var locationTableView: UITableView!
    var locations = [Location]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSlideMenuButton()
        loadLocations()
        locationTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "locationCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LocationTableViewCell  else {
            fatalError("The dequeued cell is not an instance of LocationTableViewCell.")
        }
        
        cell.locationName.text = locations[indexPath.row].name
        
        return cell
    }
    
    private func loadLocations() {
        guard let location1 = Location(name: "Sello K CityMarket", address: "Sello") else {
            fatalError("Unable to instantiate location1")
        }
        
        guard let location2 = Location(name: "Sello Prisma", address: "Sello") else {
            fatalError("Unable to instaniate location2")
        }
        
        guard let location3 = Location(name: "Sello Lidl", address: "Sello") else {
            fatalError("Unable to instaniate location3")
        }
        
        guard let location4 = Location(name: "Leppävaara K Market", address: "Galleria") else {
            fatalError("Unable to instaniate location3")
        }
        
        locations += [location1, location2, location3, location4]
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
