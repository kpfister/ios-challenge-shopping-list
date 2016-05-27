//
//  ShoppingList+CoreDataProperties.swift
//  ShoppingList
//
//  Created by Karl Pfister on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ShoppingList {

    @NSManaged var title: String
    @NSManaged var isComplete: NSNumber

}
