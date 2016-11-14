//
//  Companies.swift
//  fiNDme
//
//  Created by Cory Jbara on 11/13/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import Foundation

class Companies {
    //var companies: [Company]
    
    var companyArray : [Company]
    var count : Int {
        return companyArray.count
    }
    
    init(companyArray: [Company]) {
        self.companyArray = companyArray
    }
    
    func addCompany(company: Company) {
        companyArray.append(company)
    }
    
}
