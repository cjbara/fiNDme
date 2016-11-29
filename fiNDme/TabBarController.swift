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
    var dbSearch = Database()
    var colors = Colors()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let names = ["284 Partners", "84.51", "Accenture", "Accion Chicago", "Advyzon", "Albourne Partners", "Bain & Company", "Booz Allen Hamilton", "Boston Consulting Group", "Capstone LLC", "CBS", "CDC", "Coca-Cola", "Dean & Company", "Deloitte", "Efficio", "Epic", "Ernst & Young", "Fiserv", "Glassdoor", "KPGM LLP", "Nike", "PepsiCo","PwC",]
        let industries = ["Consulting","Consulting, Finance","Consulting","Finance","Finance, Accounting", "Finance","Management Consulting","Government","Management Consulting","Finance, Investing","Marketing, Media","Finance","Sales, Manufacturing","Accounting, Consulting","Accounting, Consulting", "Private Equity","Technology Consulting", "Acounting, Consulting", "Pharma, Consulting", "Investing", "Accounting, Tax, Audit", "Sales, Marketing", "Sales, Marketing, Manufacturing", "Accounting, Consulting"]
        let about = ["","","","","","","","","","","","","","","Deloitte is the brand under which tens of thousands of dedicated professionals in independent firms throughout the world collaborate to provide audit, consulting, financial advisory, risk management, tax, and related services to select clients. These firms are members of Deloitte Touche Tohmatsu Limited, a UK private company limited by guarantee","","","EY is a multinational professional services firm headquartered in London, United Kingdom. EY is one of the largest professional services firm in the world and is one of the Big Four professional service firms. The organization operates as a network of member firms which are separate legal entities in individual countries. It has 231,000 employees in over 700 offices around 150 countries in the world. It provides assurance (including financial audit), tax, consulting and advisory services to companies","","","KPMG LLP, the audit, tax and advisory firm, is the U.S. member firm of KPMG International. KPMG International's member firms have 113,000 professionals, including more than 6,800 partners, in 148 countries. We offer our clients industry insights and a multidisciplinary range of services. KPMG's Audit practice uses a methodology that transforms the audit process from a traditional compliance-driven function to a risk-based approach by creating a framework for auditors to assess how a client's business risks affect financial statements. This approach offers a more comprehensive view of how a client's unique risk environment affects its financial reporting","","","PricewaterhouseCoopers (trading as PwC) is a multinational professional services network headquartered in London, United Kingdom. It is the largest professional services firm in the world, and is one of the Big Four auditors, along with Deloitte, EY and KPMG. Vault Accounting 50 has ranked PwC as the most prestigious accounting firm in the world for seven consecutive years, as well as the top firm to work for in North America for three consecutive years"]
        let jobs = ["","","","","","","","","","","","","","","Full-time, Internship","","","Internship","","","Full-time","","","Full-time, Internship"]
        let contacts = ["","","","","","","","","","","","","","","Caroline Kahyaoglu: caroline.kahyaoglu@deloitte.com","","","Lauren Belles: lauren.belles@ey.com","","","Ashley Fosnaugh: ashley.fosnaugh@kpmg.com","","","Lindsey Besio: lindsey.besio@pwc.com"]
        let logos = [#imageLiteral(resourceName: "284Partners"),#imageLiteral(resourceName: "8451"),#imageLiteral(resourceName: "accenture"), #imageLiteral(resourceName: "accionchicago"),#imageLiteral(resourceName: "advyzon"),#imageLiteral(resourceName: "albourne"),#imageLiteral(resourceName: "bain"),#imageLiteral(resourceName: "boozallen"),#imageLiteral(resourceName: "bcg"),#imageLiteral(resourceName: "capstone"),#imageLiteral(resourceName: "cbs"),#imageLiteral(resourceName: "cdc"),#imageLiteral(resourceName: "cocacola"),#imageLiteral(resourceName: "dean"),#imageLiteral(resourceName: "Deloitte"),#imageLiteral(resourceName: "efficion"),#imageLiteral(resourceName: "epic"),#imageLiteral(resourceName: "EY"),#imageLiteral(resourceName: "fiserv"),#imageLiteral(resourceName: "glassdoor"),#imageLiteral(resourceName: "KPMG"),#imageLiteral(resourceName: "nike"),#imageLiteral(resourceName: "pepsi"),#imageLiteral(resourceName: "PwC")]
        /*
        let names = ["Deloitte","KPMG","PwC","Ernst & Young","Accenture"]
        let industries = ["Accounting, Consulting", "Accounting, Tax, Audit", "Accounting, Consulting", "Accounting", "Consulting"]
        let about = ["","","","",""]
        let jobs = ["Full-time, Internship", "Full-time", "Full-time, Internship","Internship","Full-time"]
        let contacts = ["","","","",""]
        let logos = [#imageLiteral(resourceName: "Deloitte"),#imageLiteral(resourceName: "KPMG"),#imageLiteral(resourceName: "PwC"),#imageLiteral(resourceName: "EY"),#imageLiteral(resourceName: "emptyLogo")]
        */
        //for name in names {
        for i in 0 ..< names.count {
            let companyToAdd = Company(name: names[i], industries: industries[i], about: about[i], jobs: jobs[i], contact: contacts[i], logo: logos[i])
            db.addCompany(company: companyToAdd)
        }
        /*
        for j in 0 ..< allNames.count {
            let companyAdd = Company(name: allNames[j], industries: allIndustries[j], about: allAbout[j], jobs: allJobs[j], contact: allContacts[j], logo: allLogos[j])
            dbSearch.addCompany(company: companyAdd)
        }
        */
        db.companies[14].favorite.setFav()
        db.companies[17].favorite.setFav()
        db.companies[20].favorite.setFav()
        
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
