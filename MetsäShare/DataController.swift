//
//  DataController.swift
//  MetsäShare
//
//  Created by iosdev on 13.12.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit
import CoreData

// This class is intended to be used with a database in swift known as Core Data, the functionality of this would be to store persistant data within the memory of the phone and allow for more functionality to the application. Due to lack of time in the project this class was not finalized as there was an error on the 13th December which could not be fixed in time.
class DataController {
    
    var persistentContainer : NSPersistentContainer?
    var managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)

    // Create an instance of the class (Singleton) and share the functions across the application
    static let sharedInstance = DataController()
    
    init() {
        //This resource is the same name as your xcdatamodeld contained in your project
        guard let modelURL = Bundle.main.url(forResource: "MetsaShare", withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        
        managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = psc
        
        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
        queue.async {
            guard let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
                fatalError("Unable to resolve document directory")
            }
            let storeURL = docURL.appendingPathComponent("MetsaShare.sqlite")
            do {
                try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
                //The callback block is expected to complete the User Interface and therefore should be presented back on the main queue so that the user interface does not need to be concerned with which queue this call is coming from.
            } catch {
                fatalError("Error migrating store: \(error)")
            }
        }
    }
    
    /* private init() {
        //make init private so that no other class can initialize it
        persistentContainer = NSPersistentContainer(name: "MetsaShare");
        persistentContainer!.loadPersistentStores() { (description, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
        
        //This resource is the same name as your xcdatamodeld contained in your project
        guard let modelURL = Bundle.main.url(forResource: "MetsaShare", withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom);
        
        managedObjectContext.persistentStoreCoordinator = psc;
        
        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
        queue.async {
            guard let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
                fatalError("Unable to resolve document directory")
            }
            let storeURL = docURL.appendingPathComponent("MetsaShare")
            do {
                try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
                //The callback block is expected to complete the User Interface and therefore should be presented back on the main queue so that the user interface does not need to be concerned with which queue this call is coming from.
            } catch {
                fatalError("Error migrating store: \(error)")
            }
        }
        // Return current Products
        fetchEntities("Product");
    } */

    // Saving Objects

    func saveProduct(productWrap: ProductWrapper) {
        let product = NSEntityDescription.insertNewObject(forEntityName: "Product", into: managedObjectContext) as! ProductMO
        product.name = productWrap.productName
        product.height = Int16(productWrap.productHeight!)
        product.width = Int16(productWrap.productWidth!)
        product.depth = Int16(productWrap.productDepth!)
        product.eanCode = Int64(productWrap.productEAN!)
        product.outOfStock = productWrap.productOutOfStock!
        
        saveContext()
    }
    
    func saveLocation(locationWrap: LocationWrapper) {
        let location = NSEntityDescription.insertNewObject(forEntityName: "Location", into: managedObjectContext) as! LocationMO
        location.name = locationWrap.name
        location.address = locationWrap.address
        location.chain = locationWrap.chain
        location.contact = locationWrap.contact
        
        saveContext()
    }
    
    // Save Context function
    private func saveContext() {
        do {
            try managedObjectContext.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
    }
    
    
    // Fetch Objects from Data model
    func fetchEntities(_ withEntityName: String, withSearchTerm: String? = nil, forVariable: String? = nil) -> [NSManagedObject]{
        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: withEntityName);
        if((withSearchTerm != nil) && (forVariable != nil)){
            fetchrequest.predicate = NSPredicate(format: "\(forVariable!) == %@", withSearchTerm!);
        }
        do {
            let fetchrResult = try managedObjectContext.fetch(fetchrequest) as! [NSManagedObject];
            return fetchrResult;
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    }

}
