//
//  ContactTableViewCell.swift
//  fiNDme
//
//  Created by Cory Jbara on 11/15/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import UIKit

protocol ButtonCellDelegate {
    func cellTapped(cell: ContactTableViewCell)
}

class ContactTableViewCell: UITableViewCell {
    
    var buttonDelegate : ButtonCellDelegate?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var message: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
