//
//  Profile.swift
//  fiNDme
//
//  Created by Cory Jbara on 11/7/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import Foundation

class Profile {
    var name: String
    var email: String
    var phone: String
    var school: String
    var major: String
    var interests: [String]
    
    init() {
        self.email = ""
        self.name = ""
        self.phone = ""
        self.school = ""
        self.major = ""
        self.interests = []
    }
    
    init(name: String, email: String, phone: String, school: String, major: String, interests: [String]) {
        self.email = email
        self.name = name
        self.phone = phone
        self.school = school
        self.major = major
        self.interests = interests
    }
    
    var text: String {
        var s = "\(self.email)\n"
        s += "\(self.phone)\n"
        s += "\(self.school)\n"
        s += "\(self.major)\n"
        
        for interest in interests {
            s += interest
            s += ","
        }
        
        s = s.substring(to: s.index(before: s.endIndex))
        
        return s
    }
    
    var interestsText: String {
        var s: String = ""
        for interest in interests {
            s += interest
            s += ", "
        }
        
        s = s.substring(to: s.index(before: s.endIndex))
        s = s.substring(to: s.index(before: s.endIndex))
        return s
    }
}
