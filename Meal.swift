//
//  Meal.swift
//  FoodTracker
//
//  Created by Rollin Francois on 8/5/16.
//  Copyright © 2016 Rollin Francois. All rights reserved.
//

import UIKit

class Meal {
    // ROLLIN - Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int) {
       
        // Initiale stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Initialization should fail if there is no name or if the rating is negative
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}
