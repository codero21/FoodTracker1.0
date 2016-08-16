//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Rollin Francois on 7/26/16.
//  Copyright © 2016 Rollin Francois. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    // ROLLIN: Properties
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5
    
    

    // ROLLIN: Initialization
    override func layoutSubviews() {
        // Sets the button's width and height to a square the size of e frame's height.
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updatButtonSelectionStates()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let emptyStarImage = UIImage(named: "emptyStar")
        let filledStarImage = UIImage(named: "filledStar")
        
        for _ in 0..<starCount {
            let button = UIButton()
            
            // Set button states
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            button.backgroundColor = UIColor.redColor()
            
            // This is to make sure that the image doesn't show an
            // additional highlight during the state change
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)),
                             forControlEvents: .TouchDown)
            ratingButtons += [button]
     
            addSubview(button)
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        
        return CGSize(width: width, height: buttonSize)
        
        // return CGSize(width: 44, height: 44)
    }

    // ROLLIN: Button Actoins
    func ratingButtonTapped(button: UIButton) {
        // Test - print to console
        // print("Button Pressed 👍🏾")
        
        rating = ratingButtons.indexOf(button)! + 1
        
        updatButtonSelectionStates()
    }
    
    // A helper method used to update the selection state of the buttons
    func updatButtonSelectionStates() {
        
        for (index, button) in ratingButtons.enumerate() {
            // If the index of a button is less than the rating, that button should be selected
            button.selected = index < rating
        }
    }
}
