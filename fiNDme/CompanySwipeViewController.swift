//
//  DeloitteViewController.swift
//  fiNDme
//
//  Created by Jose Alberto Suarez on 11/20/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import UIKit

class CompanySwipeViewController: UIViewController {

    var company: Company = Company()
    var db = Database()
    
    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet var companyName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        companyName.text = company.name

        // Do any additional setup after loading the view.
        companyImage.image = company.logo
        
        self.companyImage.layer.cornerRadius = self.companyImage.frame.size.width / 2;
        self.companyImage.clipsToBounds = true;
        
        self.companyImage.layer.borderWidth = 3.0;
        self.companyImage.layer.borderColor = UIColor.black.cgColor
        
        favoriteButton.setImage(company.favorite.image, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func favoriteAction(_ sender: Any) {
        company.favorite.setFav()
        favoriteButton.setImage(company.favorite.image, for: .normal)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        /* if segue.identifier == "goToCompany2" {
            let showCompanyVC = segue.destination as! CompanyViewController
            let index = (sender as! NSIndexPath).row
            showCompanyVC.db = db
            if let i = db.companies.index(where: {$0.name == db.favorites[index].name}) {
                showCompanyVC.index = i
            } else {
                showCompanyVC.index = 0
            }
        } */
    }
    
    
    @IBAction func handleTouch(recognizer: UITapGestureRecognizer) {
        /* SEGUE TO COMPANY DETAILS PAGE
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "companyVC")
        self.present(vc, animated: true, completion: nil)
        */
    }
    
    /*
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPointZero, inView: self.view)
    }
    */

}
