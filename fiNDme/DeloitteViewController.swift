//
//  DeloitteViewController.swift
//  fiNDme
//
//  Created by Jose Alberto Suarez on 11/20/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import UIKit

class DeloitteViewController: UIViewController {

    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        companyImage.image = #imageLiteral(resourceName: "Deloitte")
        
        self.companyImage.layer.cornerRadius = self.companyImage.frame.size.width / 2;
        self.companyImage.clipsToBounds = true;
        
        self.companyImage.layer.borderWidth = 3.0;
        self.companyImage.layer.borderColor = UIColor.black.cgColor
        
        favoriteButton.setImage(#imageLiteral(resourceName: "empty-star"), for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func favoriteAction(_ sender: Any) {
        favoriteButton.setImage(#imageLiteral(resourceName: "star"), for: .normal)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func handleTouch(recognizer: UITapGestureRecognizer) {
        let name : String = "Deloitte"
        
        /* SEGUE TO COMPANY DETAILS PAGE */
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
