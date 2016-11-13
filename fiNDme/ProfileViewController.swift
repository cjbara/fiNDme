//
//  ProfileViewController.swift
//  fiNDme
//
//  Created by Cory Jbara on 11/7/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profile = Profile(name: "Jose Suarez", email: "jsuarezm@nd.edu", phone: "(708) 837-6127", school: "University of Notre Dame", major: "Accounting", interests: ["Tax", "Audit", "Chicago", "Full-Time"])

    
    @IBOutlet var profileLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = profile.name
        profileLabel.text = profile.text
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
