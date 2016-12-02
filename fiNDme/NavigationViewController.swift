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
        
        self.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24)!, NSForegroundColorAttributeName: UIColor.white]
        //self.navigationBar.barTintColor = UIColor(red:0.54, green:0.55, blue:0.56, alpha:1.0)
        self.navigationBar.barTintColor = UIColor(red:0.30, green:0.85, blue:0.39, alpha:1.0)
        //self.navigationBar.tintColor = UIColor.white
        //self.navigationBar.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0)

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
