//
//  PWCViewController.swift
//  fiNDme
//
//  Created by Jose Alberto Suarez on 11/20/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import UIKit

class PWCViewController: UIViewController {

    @IBOutlet weak var companyImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        companyImage.image = #imageLiteral(resourceName: "PwC")
        
        self.companyImage.layer.cornerRadius = self.companyImage.frame.size.width / 2;
        self.companyImage.clipsToBounds = true;
        
        self.companyImage.layer.borderWidth = 3.0;
        self.companyImage.layer.borderColor = UIColor.black.cgColor
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
