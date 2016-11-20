//
//  FindTableViewController.swift
//  fiNDme
//
//  Created by Jose Alberto Suarez on 11/13/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import UIKit

class FindTableViewController: UITableViewController {

    var companies = [Company]()
    var companyList = Companies()
    
    var filteredCompanies = [Company]()
    let searchController = UISearchController(searchResultsController: nil)
    
    enum ErrorHandling:Error
    {
        case networkError
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // UISearchController
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        
        searchController.searchBar.scopeButtonTitles = ["All", "Full-Time", "Internship"]
        searchController.searchBar.delegate = self
        
        companyList = Companies(companyArray: companies)
    
        loadCompanies()
    }
    
    func loadCompanies() {

        let company1 = Company(name: "Deloitte", industries: "Accounting, Consulting", about: "Hi", jobs: "Full-Time, Internship", contact: "TBD", logo: #imageLiteral(resourceName: "Deloitte"))
        let company2 = Company(name: "KPMG", industries: "Accounting, Tax, Audit", about: "Hi",jobs: "Full-Time", contact: "TBD", logo: #imageLiteral(resourceName: "KPMG"))
        let company3 = Company(name: "PricewaterhouseCoopers", industries: "Accounting, Consulting", about: "Hi",jobs: "Full-Time, Internship", contact: "TBD", logo: #imageLiteral(resourceName: "PwC"))
        let company4 = Company(name: "Ernst & Young", industries: "Accounting", about: "Hi", jobs: "Internship", contact: "TBD", logo: #imageLiteral(resourceName: "EY"))

        companyList.addCompany(company: company1)
        companyList.addCompany(company: company2)
        companyList.addCompany(company: company3)
        companyList.addCompany(company: company4)
        
    
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredCompanies = companies.filter { company in
            let categoryMatch = (scope == "All") || (company.jobs == scope) || (company.jobs == scope)
            return  categoryMatch && company.name.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredCompanies.count
        }
        return companyList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyCell", for: indexPath) as! CompanyTableViewCell

        // Configure the cell...
        if searchController.isActive && searchController.searchBar.text != "" {
            let company = filteredCompanies[indexPath.row] as Company
            cell.name.text = company.name
            cell.industries.text = company.industries
            cell.logo.image = company.logo
            cell.favorite.setImage(company.favorite.image, for: UIControlState.normal)
        } else {
            let company = companyList.companyArray[indexPath.row] as Company
            cell.name.text = company.name
            cell.industries.text = company.industries
            cell.logo.image = company.logo
            cell.favorite.setImage(company.favorite.image, for: UIControlState.normal)
        }
        
        //cell.companyCell = c
        
        return cell
/*
        let company = companyList.companyArray[indexPath.row] as Company
        cell.name.text = company.name
        cell.industries.text = company.industries
        cell.logo.image = company.logo

        cell.favorite.setImage(company.favorite.image, for: UIControlState.normal)
*/
        //companyImage.image = company.image
        
        //self.companyImage.layer.cornerRadius = self.companyImage.frame.size.width / 2;
        //self.companyImage.clipsToBounds = true;
        
        //self.companyImage.layer.borderWidth = 3.0;
        //self.companyImage.layer.borderColor = UIColor.black.cgColor
        
        
        //return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        /*
        if let vc = segue.destination as? CompanyViewController,
            let cell = sender as? UITableViewCell,
            let indexPath = self.tableView.indexPath(for: cell) {
            
            vc.company = self.companyList.companyArray[indexPath.row]
        }
        */
        
        if let showCompanyVC = segue.destination as? CompanyViewController {
            if let cell = sender as? UITableViewCell {
                let indexPath = self.tableView.indexPath(for: cell)
                if let index = indexPath?.row {
                    if (searchController.isActive && searchController.searchBar.text != "") {
                        showCompanyVC.company = filteredCompanies[index]
                    } else {
                        showCompanyVC.company = self.companyList.companyArray[index]
                    }
                }
            }
        }
    }


}


extension FindTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}

extension FindTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}
