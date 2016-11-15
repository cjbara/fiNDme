//
//  ContactTableViewCell.swift
//  fiNDme
//
//  Created by Cory Jbara on 11/15/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    
    @IBOutlet var name: UILabel!
    @IBOutlet var title: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
