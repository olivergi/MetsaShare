//
//  DataController.swift
//  MetsäShare
//
//  Created by iosdev on 13.12.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit
import CoreData

class DataController: NSObject {
    var managedObjectContext: NSManagedObjectContext
    var persistentContainer : NSPersistentContainer?;
    
    init(completionClosure: @escaping () -> ()) {
        //This resource is the same name as your xcdatamodeld contained in your project
        guard let modelURL = Bundle.main.url(forResource: "DataModel", withExtension:"momd") else {
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
            let storeURL = docURL.appendingPathComponent("DataModel.sqlite")
            do {
                try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
                //The callback block is expected to complete the User Interface and therefore should be presented back on the main queue so that the user interface does not need to be concerned with which queue this call is coming from.
                DispatchQueue.main.sync(execute: completionClosure)
            } catch {
                fatalError("Error migrating store: \(error)")
            }
        }
    }
    
    // Saving Objects

    func saveProduct(productWrap: ProductWrapper) {
        let product = NSEntityDescription.insertNewObject(forEntityName: "Product", into: managedObjectContext) as! ProductMO
        product.name = productWrap.productName
        product.height = Int16(productWrap.productHeight!)
        product.width = Int16(productWrap.productWidth!)
        product.depth = Int16(productWrap.productDepth!)
        product.eanCode = Int16(productWrap.productEAN!)
        product.outOfStock = productWrap.productOutOfStock!
        
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

}
