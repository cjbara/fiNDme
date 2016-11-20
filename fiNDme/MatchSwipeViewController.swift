//
//  MatchSwipeViewController.swift
//  fiNDme
//
//  Created by Jose Alberto Suarez on 11/20/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import UIKit

class MatchSwipeViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let deloitteVC : DeloitteViewController = DeloitteViewController(nibName: "DeloitteViewController", bundle: nil)
        let eyVC : EYViewController = EYViewController(nibName: "EYViewController", bundle: nil)
        let pwcVC : PWCViewController = PWCViewController(nibName: "PWCViewController", bundle: nil)
        let kpmgVC : KPMGViewController = KPMGViewController(nibName: "KPMGViewController", bundle: nil)
        
        self.addChildViewController(kpmgVC)
        self.scrollView!.addSubview(kpmgVC.view);
        kpmgVC.didMove(toParentViewController: self)
        
        self.addChildViewController(pwcVC)
        self.scrollView!.addSubview(pwcVC.view);
        pwcVC.didMove(toParentViewController: self)
        
        self.addChildViewController(eyVC)
        self.scrollView!.addSubview(eyVC.view);
        eyVC.didMove(toParentViewController: self)
        
        self.addChildViewController(deloitteVC)
        self.scrollView!.addSubview(deloitteVC.view);
        deloitteVC.didMove(toParentViewController: self)
        
        var adminFrame : CGRect = deloitteVC.view.frame
        adminFrame.origin.x = adminFrame.width
        eyVC.view.frame = adminFrame
        
        var BFrame : CGRect = eyVC.view.frame
        BFrame.origin.x = 2*BFrame.width
        pwcVC.view.frame = BFrame
        
        var CFrame : CGRect = pwcVC.view.frame
        CFrame.origin.x = 3*CFrame.width
        kpmgVC.view.frame = CFrame
        
        let scrollWidth : CGFloat = 4 * self.view.frame.width
        //let scrollHeigth : CGFloat = self.view.frame.size.height
        let scrollHeigth : CGFloat = 450
        self.scrollView!.contentSize = CGSize(width: scrollWidth, height: scrollHeigth)
        
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
