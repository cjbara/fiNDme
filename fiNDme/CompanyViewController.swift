//
//  CompanyViewController.swift
//  fiNDme
//
//  Created by Cory Jbara on 11/13/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import UIKit

class CompanyViewController: UIViewController {

    @IBOutlet var companyImage: UIImageView!
    @IBOutlet var companyName: UILabel!
    @IBOutlet var favorite: UIButton!
    
    var db = Database()
    var company = Company()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        if (index == -1) {
            // do nothing
        } else {
            company = db.companies[index]
        }

        companyName.text = company.name
        favorite.setImage(company.favorite.image, for: UIControlState.normal)
        companyImage.image = company.logo
        
        //self.companyImage.layer.cornerRadius = self.companyImage.frame.size.width / 2;
        //self.companyImage.clipsToBounds = true;
        
        //self.companyImage.layer.borderWidth = 3.0;
        //self.companyImage.layer.borderColor = UIColor.black.cgColor
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeFavorite(_ sender: Any) {
        company.favorite.setFav()
        favorite.setImage(company.favorite.image, for: UIControlState.normal)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "accordeon" {
            let destVC = segue.destination as! AccordionViewController
            destVC.company = self.company
            destVC.db = self.db
            destVC.index = self.index
        }
    }
    

}
