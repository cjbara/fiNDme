//
//  TabBarController.swift
//  fiNDme
//
//  Created by Cory Jbara on 11/7/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    var colors = Colors()

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
