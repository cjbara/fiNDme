//
//  MapViewController.swift
//  fiNDme
//
//  Created by Cory Jbara on 11/7/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import UIKit
import CoreGraphics

class MapViewController: UIViewController {
    
    var db = Database()
    var clickedCompany: String = ""
    
    @IBOutlet var youAreHere: UILabel!
    @IBOutlet var deloitteImage: UIButton!
    @IBOutlet var deloitteCircle: UIView!
    @IBOutlet var eyImage: UIButton!
    @IBOutlet var eyCircle: UIView!
    @IBOutlet var kpmgImage: UIButton!
    @IBOutlet var kpmgCircle: UIView!
    @IBOutlet var pwcImage: UIButton!
    @IBOutlet var pwcCircle: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = (self.tabBarController as! TabBarController).db
        
        deloitteImage.setImage(#imageLiteral(resourceName: "Deloitte"), for: UIControlState.normal)
        eyImage.setImage(#imageLiteral(resourceName: "EY"), for: UIControlState.normal)
        kpmgImage.setImage(#imageLiteral(resourceName: "KPMG"), for: UIControlState.normal)
        pwcImage.setImage(#imageLiteral(resourceName: "PwC"), for: UIControlState.normal)
        
        youAreHere.layer.cornerRadius = youAreHere.frame.width/2
        youAreHere.clipsToBounds = true
        
        deloitteCircle.layer.cornerRadius = deloitteCircle.frame.width/2
        deloitteCircle.clipsToBounds = true
        
        eyCircle.layer.cornerRadius = eyCircle.frame.width/2
        eyCircle.clipsToBounds = true
        
        kpmgCircle.layer.cornerRadius = kpmgCircle.frame.width/2
        kpmgCircle.clipsToBounds = true
        
        pwcCircle.layer.cornerRadius = pwcCircle.frame.width/2
        pwcCircle.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showDeloitte(_ sender: UIButton) {
        clickedCompany = "Deloitte"
        performSegue(withIdentifier: "showCompanyFromMap", sender: self)
    }

    @IBAction func showEY(_ sender: UIButton) {
        clickedCompany = "Ernst & Young"
        performSegue(withIdentifier: "showCompanyFromMap", sender: self)
    }
    
    @IBAction func showKPMG(_ sender: UIButton) {
        clickedCompany = "KPMG LLP"
        performSegue(withIdentifier: "showCompanyFromMap", sender: self)
    }
    
    @IBAction func showPWC(_ sender: UIButton) {
        clickedCompany = "PwC"
        performSegue(withIdentifier: "showCompanyFromMap", sender: self)
    }
    
    // MARK: - Navigation

    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let showCompanyVC = segue.destination as! CompanyViewController
        showCompanyVC.db = db
        if let i = db.companies.index(where: {$0.name == clickedCompany}) {
            showCompanyVC.index = i
        } else {
            showCompanyVC.index = 0
        }
    }
    

}
