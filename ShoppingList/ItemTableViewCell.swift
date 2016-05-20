//
//  itemTableViewCell.swift
//  ShoppingList
//
//  Created by Karl Pfister on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
protocol ItemTableViewCellDelegate {
    func itemValueChanged(cell: ItemTableViewCell, isComplete: Bool)
}

class ItemTableViewCell: UITableViewCell {
    
    var delegate: ItemTableViewCellDelegate?
    var items: ShoppingItem?
    
    //MARK: - Actions
    
    func setUpCellWithItems(items: ShoppingItem) {
        self.items = items
        itemLabel.text = items.name
        completionSwitch.on = Bool(items.isComplete)
    }

    
    
    
    
    //MARK: - Outlets 
    
    
    
    @IBOutlet weak var itemLabel: UITextField!
    
    
    @IBOutlet weak var completionSwitch: UISwitch!
    
    //MARK: - Actions
    
    
    @IBAction func completionValueChanged(sender: UISwitch) {
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
