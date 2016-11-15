//
//  Contact.swift
//  fiNDme
//
//  Created by Cory Jbara on 11/15/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import Foundation
import UIKit

class Contact {
    var name: String = ""
    var company: String = ""
    var title: String = ""
    var email: String = ""
    var picture: UIImage?
    
    init(name: String, company: String, title: String, email: String) {
        self.name = name
        self.title = title
        self.email = email
        self.company = company
    }
}
