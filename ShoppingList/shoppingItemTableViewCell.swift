//
//  shoppingItemTableViewCell.swift
//  ShoppingList
//
//  Created by Karl Pfister on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class shoppingItemTableViewCell: UITableViewCell {
    
    //MARK: Outlets -
    
    
    @IBOutlet weak var shoppingItemTextField: UITextField!
    
    @IBOutlet weak var button: UIButton!
    
    
    //MARK: Delegate - 
    
    weak var delegate: ShoppingListShoppingItemCellDelegate?
    
    func updateWithShoppingList(shoppingList: ShoppingList) {
        shoppingItemTextField.text = shoppingList.title
        isCompleteValueChanged(shoppingList.isComplete.boolValue)
        
    }
    
    func isCompleteValueChanged(value: Bool) {
        if value == true {
            button.imageView?.image = UIImage(named: "complete")
        } else {
            button.imageView?.image = UIImage(named: "incomplete")
        }
    }
    
    
    //MARK: Action - 

    @IBAction func buttonTapped(sender: AnyObject) {
        delegate?.shoppingItemCellButtonTapped(self)
    }
    
    
}

//Protocol

protocol ShoppingListShoppingItemCellDelegate: class {
    func shoppingItemCellButtonTapped(cell: shoppingItemTableViewCell)
}
