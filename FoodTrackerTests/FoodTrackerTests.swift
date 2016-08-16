//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Rollin Francois on 7/22/16.
//  Copyright © 2016 Rollin Francois. All rights reserved.
//

import UIKit
import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    // ROLLIN - FoodTracker Tests to confirm that the Meal initializer returns when no name or 
    // negative rating is provided.
    func testMealInitialization() {
        
        // Success case
        let potentialItem = Meal(name: "Newest Meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        // Failure case
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Meal(name: "Really Bad Rating", photo: nil, rating: -1)
        XCTAssertNil(badRating, "Negative ratings are invalid, be positive")
        
        
    }
    
}
