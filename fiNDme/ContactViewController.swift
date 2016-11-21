//
//  ContactViewController.swift
//  fiNDme
//
//  Created by Cory Jbara on 11/7/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var exchange: UIButton!
    @IBOutlet weak var myContacts: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        exchange.layer.cornerRadius = 4
        myContacts.layer.cornerRadius = 4
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

