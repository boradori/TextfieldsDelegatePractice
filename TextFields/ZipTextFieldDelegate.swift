//
//  ZipTextFieldDelegate.swift
//  TextFields
//
//  Created by Youngsun Paik on 3/18/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import Foundation
import UIKit

class ZipTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        
        var newText: NSString = textField.text!
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        let newTextString = String(newText)
        
//        let disallowedCharacterSet = NSCharacterSet(charactersInString: "0123456789").invertedSet
        
        let digit = NSCharacterSet.decimalDigitCharacterSet()
        var digitText = ""
        
        for c in newTextString.unicodeScalars {
            if digit.longCharacterIsMember(c.value) && digitText.characters.count < 5 {
                digitText += String(c)
                print(digitText)
            }
        }

        textField.text = digitText

        return false
    }
    
}