//
//  ShoppingList.swift
//  ShoppingList
//
//  Created by Karl Pfister on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData


class ShoppingList: NSManagedObject {

    convenience init?(title: String, isComplete: Bool = false, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        guard let entity = NSEntityDescription.entityForName("ShoppingList", inManagedObjectContext: context) else {return nil}
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.title = title
        self.isComplete = isComplete
    }

}
