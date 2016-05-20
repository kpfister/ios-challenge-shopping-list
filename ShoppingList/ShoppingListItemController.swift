//
//  ShoppingListItemController.swift
//  ShoppingList
//
//  Created by Karl Pfister on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class ShoppingListItemsController {
    static let sharedInstance = ShoppingListItemsController() // This is a singleton
    
    var items: [ShoppingItem] // items is an array of ShoppingList.
    
    init() { // This init will initialize this class.
        items = []
    }
}