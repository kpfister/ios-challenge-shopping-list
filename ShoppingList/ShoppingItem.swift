//
//  ShoppingItem.swift
//  ShoppingList
//
//  Created by Karl Pfister on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData


class ShoppingItem: NSManagedObject {
    
    static let sharedInstance = ShoppingItem()
    
    convenience init(name: String, isComplete: Bool, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext){
        let entity = NSEntityDescription.entityForName("ShoppingItem", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.name = name
        self.isComplete = false
        
    }

    
}
