//
//  Database.swift
//  fiNDme
//
//  Created by Cory Jbara on 11/28/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import Foundation
import UIKit

class Database {
    var profile: Profile
    var companies: [Company]
    var contacts: [Contact]
    
    var favorites: [Company] {
        var f: [Company] = []
        for company in companies {
            if company.favorite.favorite == true {
                f.append(company)
            }
        }
        return f
    }
    
    init() {
        self.profile = Profile()
        self.companies = []
        self.contacts = []
    }
    
    init(profile: Profile, companies: [Company], contacts: [Contact]){
        self.profile = profile
        self.companies = companies
        self.contacts = contacts
    }
    
    func addCompany(company: Company) {
        companies.append(company)
    }
    
    func addContact(contact: Contact) {
        contacts.append(contact)
    }
    
    var desc: String {
        return "Companies: \(companies.count)\nContacts: \(contacts.count)\nFavorites: \(favorites.count)"
    }
}
