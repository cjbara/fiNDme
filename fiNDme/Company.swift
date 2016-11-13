//
//  Company.swift
//  fiNDme
//
//  Created by Cory Jbara on 11/13/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import Foundation
import UIKit

class Company {
    var name: String = ""
    var about: String = ""
    var jobs: String = ""
    var contact: String = ""
    
    var image: UIImage = UIImage(named: "Deloitte")!
    
    var favorite = Favorite()
    
    init() {
        name = "Deloitte"
        about = "Stuff about Deloitte"
        jobs = "Job information"
        contact = "My name is cory"
    }
}
