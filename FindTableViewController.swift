//
//  FindTableViewController.swift
//  fiNDme
//
//  Created by Jose Alberto Suarez on 11/13/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import UIKit

class FindTableViewController: UITableViewController, StarCellDelegate {

    var db = Database()
    var filteredCompanies: [Company] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    enum ErrorHandling:Error
    {
        case networkError
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        db = (self.tabBarController as! TabBarController).db
        
        // UISearchController
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        
        searchController.searchBar.scopeButtonTitles = ["All", "Full-time", "Internship"]
        //searchController.searchBar.scope
        searchController.searchBar.delegate = self
        
        //self.definesPresentationContext = YES;
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.definesPresentationContext = true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredCompanies = db.companies.filter { company in
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
        return db.companies.count
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
            cell.company = company
        } else {
            let company = db.companies[indexPath.row] as Company
            cell.company = company
            cell.name.text = company.name
            cell.industries.text = company.industries
            cell.logo.image = company.logo
            cell.favorite.setImage(company.favorite.image, for: UIControlState.normal)
            
            //cell.logo.layer.cornerRadius = cell.logo.frame.size.width / 2;
            //cell.logo.clipsToBounds = true;
            
            //cell.logo.layer.borderWidth = 3.0;
            //cocell.logo.layer.borderColor = UIColor.black.cgColor
        }
        
        if cell.starDelegate == nil {
            cell.starDelegate = self
        }
        return cell

    }
    
    func starTapped(cell: CompanyTableViewCell) {
        cell.company.favorite.setFav()
        cell.favorite.setImage(cell.company.favorite.image, for: .normal)
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
                    showCompanyVC.db = db
                    if (searchController.isActive && searchController.searchBar.text != "") {
                        if let i = db.companies.index(where: {$0.name == filteredCompanies[index].name}) {
                            showCompanyVC.index = i
                        } else {
                            showCompanyVC.index = 0
                        }
                    } else {
                        showCompanyVC.index = index
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
        //self.definesPresentationContext = true
    }
}

extension FindTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}
