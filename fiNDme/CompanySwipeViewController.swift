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
    
    @IBOutlet var companyImage: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet var companyName: UILabel!
    @IBOutlet var companyMatch: UILabel!
    @IBOutlet var companyIndustry: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        companyName.text = company.name

        // Do any additional setup after loading the view.
        companyImage.setImage(company.logo, for: .normal)
        
        favoriteButton.setImage(company.favorite.image, for: .normal)
        
        companyMatch.text = company.match
        companyIndustry.text = company.industries
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        favoriteButton.setImage(company.favorite.image, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func favoriteAction(_ sender: UIButton) {
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
    
    @IBAction func companyImageClick(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil) //if bundle is nil the main bundle will be used
        let controller1 = storyboard.instantiateViewController(withIdentifier: "companyVC") as! CompanyViewController
        
        controller1.index = -1
        controller1.company = company
        
        self.navigationController!.pushViewController(controller1, animated: true)
        
    }
    
}
