//
//  CompanyTableViewCell.swift
//  fiNDme
//
//  Created by Jose Alberto Suarez on 11/13/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import UIKit

protocol StarCellDelegate {
    func starTapped(cell: CompanyTableViewCell)
}

class CompanyTableViewCell: UITableViewCell {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var industries: UILabel!
    @IBOutlet weak var favorite: UIButton!
    
    var company = Company()
    
    var starDelegate : StarCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var companyCell : Company! {
        didSet {
            name.text = companyCell.name
            industries.text = companyCell.industries
            logo.image = companyCell.logo
            
        }
    }
    
    @IBAction func starTap(_ sender: Any) {
        if let delegate = starDelegate {
            delegate.starTapped(cell: self)
        }
    }
    
}
