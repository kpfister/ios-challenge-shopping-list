//
//  ShoppingListController.swift
//  ShoppingList
//
//  Created by Karl Pfister on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData


class ShoppingListController {
    static let sharedInstance = ShoppingListController()
    var fetchedResultsController: NSFetchedResultsController
    
    
    //MARK: Crud -
    
    init () {
        let request = NSFetchRequest(entityName: "ShoppingList")
        let sortDescriptor = NSSortDescriptor(key: "isComplete", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: Stack.sharedStack.managedObjectContext, sectionNameKeyPath: "isComplete", cacheName: nil)
        _ = try? fetchedResultsController.performFetch()
    }
    
    func addShoppingItem(title: String) {
        _ = ShoppingList(title: title)
        saveToPersistentStoreage()
    }
    
    func removeShoppingItem(shoppingList: ShoppingList) {
        let moc = Stack.sharedStack.managedObjectContext
        moc.deleteObject(shoppingList)
        saveToPersistentStoreage()
    }
    
    func saveToPersistentStoreage() {
        // We will need our MoC
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Did not save. There was an error")
        }
        
    }
    
    
}