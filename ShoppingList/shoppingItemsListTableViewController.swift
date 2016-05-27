//
//  shoppingItemsListTableViewController.swift
//  ShoppingList
//
//  Created by Karl Pfister on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import CoreData

class shoppingItemsListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ShoppingListController.sharedInstance.fetchedResultsController.delegate = self
    }
    
    // MARK: ActionButtons -
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        presentAlertController()
    }
    
    
    // MARK: AlertController -
    func presentAlertController() {
        
        var shoppingItemTextField: UITextField?
        
        //Create the Alert Controller
        
        let alertController = UIAlertController(title: "Add new Item", message: "What else do we need?", preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Item name..."
            shoppingItemTextField = textField
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let createACtion = UIAlertAction(title: "Add", style: .Default) { (_) in
            guard let title = shoppingItemTextField?.text where title.characters.count > 0 else {return}
            ShoppingListController.sharedInstance.addShoppingItem(title)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(createACtion)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        guard let sections = ShoppingListController.sharedInstance.fetchedResultsController.sections else {return 0}
        return sections.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = ShoppingListController.sharedInstance.fetchedResultsController.sections else {return 0}
        return sections[section].numberOfObjects
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCellWithIdentifier("shoppingItemCell", forIndexPath: indexPath) as? shoppingItemTableViewCell,
            shoppingItem = ShoppingListController.sharedInstance.fetchedResultsController.objectAtIndexPath(indexPath) as? ShoppingList else {
                return UITableViewCell()
        }
        cell.updateWithShoppingList(shoppingItem)
        cell.delegate = self
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sections = ShoppingListController.sharedInstance.fetchedResultsController.sections else {return nil}
        let value = Int(sections[section].name)
        if value == 0 {
            return "Incomplete"
        } else {
            return "Complete"
        }
        
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            guard let shoppingList = ShoppingListController.sharedInstance.fetchedResultsController.objectAtIndexPath(indexPath) as? ShoppingList else { return }
            ShoppingListController.sharedInstance.removeShoppingItem(shoppingList)
            
            // Delete the row from the table view
            
        }
    }
}


extension shoppingItemsListTableViewController: ShoppingListShoppingItemCellDelegate {
    func shoppingItemCellButtonTapped(cell: shoppingItemTableViewCell) {
        
        guard let indexPath = tableView.indexPathForCell(cell),
            shoppingItem = ShoppingListController.sharedInstance.fetchedResultsController.objectAtIndexPath(indexPath) as? ShoppingList  else {return}
        shoppingItem.isComplete = !shoppingItem.isComplete.boolValue
        cell.isCompleteValueChanged(shoppingItem.isComplete.boolValue)
        ShoppingListController.sharedInstance.saveToPersistentStoreage()
        
    }
}

extension shoppingItemsListTableViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch type {
        case .Delete:
            tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Automatic)
        case .Insert:
            tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Automatic)
        default:
            break
        }
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Delete:
            guard let indexPath = indexPath else { return }
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        case .Insert:
            guard let newIndexPath = newIndexPath else {return}
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
        case .Update:
            guard let indexPath = indexPath else {return}
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        case .Move:
            guard let indexPath = indexPath, newIndexPath = newIndexPath else {return}
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
}

























