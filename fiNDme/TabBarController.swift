//
//  TabBarController.swift
//  fiNDme
//
//  Created by Cory Jbara on 11/7/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    var db = Database()
    var colors = Colors()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let names = ["Deloitte","KPMG","PwC","Ernst & Young","Accenture"]
        let industries = ["Accounting, Consulting", "Accounting, Tax, Audit", "Accounting, Consulting", "Accounting", "Consulting"]
        let about = ["","","","",""]
        let jobs = ["Full-time, Internship", "Full-time", "Full-time, Internship","Internship","Full-time"]
        let contacts = ["","","","",""]
        let logos = [#imageLiteral(resourceName: "Deloitte"),#imageLiteral(resourceName: "KPMG"),#imageLiteral(resourceName: "PwC"),#imageLiteral(resourceName: "EY"),#imageLiteral(resourceName: "emptyLogo")]
        
        //for name in names {
        for i in 0 ..< names.count {
            let companyToAdd = Company(name: names[i], industries: industries[i], about: about[i], jobs: jobs[i], contact: contacts[i], logo: logos[i])
            db.addCompany(company: companyToAdd)
        }
        
        db.companies[0].favorite.setFav()
        db.companies[1].favorite.setFav()
        db.companies[2].favorite.setFav()
        
        db.addContact(contact: Contact(name: "Jay", company: "PwC", title: "Accountant", email: "jay@pwc.com"))
        db.addContact(contact: Contact(name: "Steve", company: "Deloitte", title: "Accountant", email: "steve@deloitte.com"))
        db.addContact(contact: Contact(name: "Heather", company: "PwC", title: "Accountant", email: "heather@pwc.com"))
        db.addContact(contact: Contact(name: "Jesse", company: "EY", title: "Accountant", email: "jesse@ey.com"))
        
        
        db.profile = Profile(name: "Jose Suarez", email: "jsuarez@nd.edu", phone: "1-234-567-8910", school: "University of Notre Dame", major: "Accounting", interests: ["Tax", "Finance", "Consulting"])
        //UITabBar.appearance().isTranslucent = false
        
        // Sets the default color of the icon of the selected UITabBarItem and Title
        //UITabBar.appearance().tintColor = UIColor.white
        
        // Sets the default color of the background of the UITabBar
        //UITabBar.appearance().barTintColor = self.colors.gold
        
        
        //custom.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "tab_icon_normal"), selectedImage: UIImage(named: "tab_icon_seelcted"))

//        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: self.colors.blue], for:.normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for:.selected)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
