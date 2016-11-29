//
//  NavigationViewController.swift
//  fiNDme
//
//  Created by Jose Alberto Suarez on 11/29/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Helvetica", size: 24)!]
        
        //self.navigationController.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Helvetica", size: 24)!]


        // Do any additional setup after loading the view.
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
