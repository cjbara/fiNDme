//
//  FavoritesCollectionViewController.swift
//  fiNDme
//
//  Created by Cory Jbara on 11/28/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import UIKit
import CoreGraphics

private let reuseIdentifier = "favoriteCell"

class FavoritesCollectionViewController: UICollectionViewController {
    
    var db = Database()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = (self.tabBarController as! TabBarController).db

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        self.collectionView?.reloadData()
        print(db.favorites.count)

    }
    
    override func viewDidAppear(_ animated: Bool) {
    
        self.collectionView?.reloadData()
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        if db.favorites.count == 0 {
            return 1
        }
        return db.favorites.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if db.favorites.count != 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FavoriteCollectionViewCell
            
            // Configure the cell
            let company = db.favorites[indexPath.row]
            cell.company = company
            cell.image.image = company.logo
            cell.name.text = company.name
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noFavorites", for: indexPath) as! NoFavoritesCollectionViewCell
            
            cell.frame = CGRect(origin: CGPoint(x: cell.frame.origin.x,y :cell.frame.origin.y), size: CGSize(width: self.view.frame.width, height: self.view.frame.height))
            return cell
        }
    }

    // MARK: UICollectionViewDelegate

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCompany" {
            let showCompanyVC = segue.destination as! CompanyViewController
            let index = (sender as! NSIndexPath).row
            showCompanyVC.db = db
            if let i = db.companies.index(where: {$0.name == db.favorites[index].name}) {
                showCompanyVC.index = i
            } else {
                showCompanyVC.index = 0
            }
        } 
    }
    
    // Set the indexPath of the selected item as the sender for the segue
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if db.favorites.count != 0 {
            performSegue(withIdentifier: "goToCompany", sender: indexPath)
        } else {
            self.tabBarController?.selectedIndex = 2;
        }
    }
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }
 
    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        performSegue(withIdentifier: "goToCompany", sender: indexPath)
    }
    */

}
