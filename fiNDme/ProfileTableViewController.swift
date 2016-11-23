//
//  ProfileTableViewController.swift
//  fiNDme
//
//  Created by Jose Alberto Suarez on 11/20/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var interests: UITextField!

    @IBOutlet weak var major: UIPickerView!
    @IBOutlet weak var job: UIPickerView!
    
    var pickerDataSource = ["Finance", "Marketing", "Accounting", "ITM"]
    var majorChosen : String = ""
    var pickerDataSource2 = ["Full-time","Internship"]
    var jobChosen : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.major.dataSource = self
        self.major.delegate = self
        
        self.job.dataSource = self
        self.job.delegate = self

    }
    
    //MARK: Data Sources
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == major {
            return pickerDataSource.count
        } else if pickerView == job {
            return pickerDataSource2.count
        }
        return 0
    }
    
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == major {
            return pickerDataSource[row]
        } else if pickerView == job {
            return pickerDataSource2[row]
        }
        return ""
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        majorChosen = pickerDataSource[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
