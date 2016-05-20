//
//  ShoppingItem+CoreDataProperties.swift
//  ShoppingList
//
//  Created by Karl Pfister on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ShoppingItem {

    @NSManaged var name: String // These are not optional. They need a name and we want to know if they are complete.
    @NSManaged var isComplete: NSNumber

}
