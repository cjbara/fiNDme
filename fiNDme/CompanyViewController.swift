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
    @IBOutlet var industry: UILabel!
    @IBOutlet var switchLabel: UITextView!
    
    var db = Database()
    var company = Company()
    var index = 0
    
    enum TabIndex : Int {
        case FirstChildTab = 0
        case SecondChildTab = 1
        case ThirdChildTab = 2
    }
    
    @IBOutlet weak var segmentedContact: UISegmentedControl!
    
    var currentViewController: UIViewController?
    
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
        industry.text = company.industries
        
        displayCurrentTab(tabIndex: TabIndex.FirstChildTab.rawValue)
        
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentViewController = currentViewController {
            currentViewController.viewWillDisappear(animated)
        }
    }
    
    // MARK: - Switching Tabs Functions
    @IBAction func switchTabs(sender: UISegmentedControl) {
        displayCurrentTab(tabIndex: sender.selectedSegmentIndex)
    }
    
    func displayCurrentTab(tabIndex: Int){
        switch tabIndex {
        case 0:
            switchLabel.text = company.about
        case 1:
            switchLabel.text = company.jobs
        case 2:
            switchLabel.text = company.contact
        default:
            switchLabel.text = "N/A"
        }
    }
    
    @IBAction func changeFavorite(_ sender: UIButton) {
        company.favorite.setFav()
        favorite.setImage(company.favorite.image, for: UIControlState.normal)
    }
}
