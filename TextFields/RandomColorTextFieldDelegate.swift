//
//  RandomColorTextFieldDelegate.swift
//  TextFields
//
//  Created by Youngsun Paik on 3/15/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import Foundation
import UIKit

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    // Create an array of colors
    let colors = [UIColor.redColor(), UIColor.orangeColor(), UIColor.yellowColor(), UIColor.greenColor(), UIColor.blueColor(), UIColor.purpleColor(), UIColor.brownColor()]
    
    func randomColor() -> UIColor {
        let randomIndex = Int(arc4random() % UInt32(colors.count))
        return colors[randomIndex]
    }

    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        // Todo: Set the color of your text here
        textField.textColor = self.randomColor()
        return true
    }
    
}
