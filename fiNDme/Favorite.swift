//
//  Favorite.swift
//  fiNDme
//
//  Created by Cory Jbara on 11/13/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import Foundation
import UIKit

class Favorite {
    var favorite: Bool = false
    
    var image: UIImage {
        if(favorite == true) {
            return UIImage(named: "star")!
        } else {
            return UIImage(named: "empty-star")!
        }
    }
    
    init() {
        favorite = false
    }
    
    func setFav() {
        favorite = !favorite
    }
}
