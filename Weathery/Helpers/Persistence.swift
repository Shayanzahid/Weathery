//
//  Persistence.swift
//  Weathery
//
//  Created by Shayan on 27/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import Foundation
import CoreData

final class Persistence {
    static let shared = Persistence()
    
    private init() {}
    
    lazy var context = persistentContainer.viewContext
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Weathery")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func save() {
        if context.hasChanges {
            do {
                try context.save()
                print("Saved successfully...")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Core Data Fetch Support
    
    func fetch<T: NSManagedObject>(_ type: T.Type) -> [T] {
        let entityName = String(describing: type)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        do {
            let objects = try context.fetch(fetchRequest) as? [T]
            return objects ?? [T]()
        } catch {
            print(error.localizedDescription)
            return [T]()
        }
    }
    
    // MARK: - Core Data Delete Support
    
    func delete(_ object: NSManagedObject) {
        context.delete(object)
        save()
    }
}
