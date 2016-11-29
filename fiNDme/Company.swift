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
    var name: String
    var industries: String
    var about: String
    var jobs: String
    var contact: String
    var logo: UIImage
        
    var favorite = Favorite()
    
    init() {
        name = "Deloitte"
        industries = "Industries"
        about = "Stuff about Deloitte"
        jobs = "Job information"
        contact = "My name is cory"
        logo = #imageLiteral(resourceName: "Deloitte")
    }
 
    init(name: String, industries: String, about: String, jobs: String, contact: String, logo: UIImage) {
        self.name = name
        self.industries = industries
        self.about = about
        self.jobs = jobs
        self.contact = contact
        self.logo = logo
    }
}
