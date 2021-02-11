//
//  CategoryCell.swift
//  iTunesTask
//
//  Created by Mahmoud Salaheldin on 2/8/21.
//  Copyright © 2021 Mahmoud Salaheldin. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? UITableViewCell.AccessoryType.checkmark : UITableViewCell.AccessoryType.none
    }
    
}
